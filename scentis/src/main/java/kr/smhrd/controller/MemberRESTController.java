package kr.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.smhrd.entity.Log;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.Music;
import kr.smhrd.entity.MyLog;
import kr.smhrd.entity.Perfume;
import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.service.MemberService;

@RestController // @Controller + @ResponseBody 비동기통신 controller
public class MemberRESTController {

	@Autowired
	private MemberMapper mapper;
	@Autowired
	private MemberService service;

	// 아이디 중복체크
	@RequestMapping("/idcheck")
	public String idcheck(String id) {
		Member dto = mapper.idCheck(id);
		String res = ""; // 사용 가능한 id = true , 불가능 = false 응답
		if (dto == null) { // id 성공
			res = "true";
		} else { // id 실패
			res = "false";
		}
		return res;
	}

	// 브랜드별 perfumeList 비동기로 보내주기
	@RequestMapping("/BrandP")
	public ArrayList<Perfume> AllP(String name) {
		ArrayList<Perfume> Pdata = mapper.AllP(name);
		return Pdata;
	}

	// 로그에서 앨범클릭 시 관련 향수 전송
	@RequestMapping(value = "/LogP", method = RequestMethod.POST)
	public ArrayList<Perfume> LogP(int num1, int num2, int num3) {
		ArrayList<Perfume> logP = mapper.LogP(num1, num2, num3);
		return logP;
	}

// 플라스크 통신1 곡명 보내기
	@RequestMapping(value = "/sendDataToFlask", method = RequestMethod.POST)
	public MyLog sendDataToFlask(@RequestBody MyLog title) {
		System.out.println("sendDataToFlask 시작");
//       System.out.println(title);

//        Music 객체를 JSON으로 변환하여 Flask 서버에 전송
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<MyLog> request = new HttpEntity<>(title, headers);

//       System.out.println(request);

		ResponseEntity<String> response = restTemplate.postForEntity("http://121.147.185.76:9000/sendDataToFlask",
				request, String.class);

//       System.out.println(response.getBody().getClass()); // String 타입

		// JSON 문자열
		String jsonString = response.getBody();
//       System.out.println(jsonString);

		// Jackson ObjectMapper 객체 생성
		ObjectMapper objectMapper = new ObjectMapper();
		MyLog Data = null;
		try {
			// JSON 문자열을 객체로 파싱
			Data = objectMapper.readValue(jsonString, MyLog.class);

//          System.out.println(Data);

			// 파싱된 데이터 꺼내기 + 확인
			List<String> TITLELIST = Data.getTitle_list();
			List<String> ARTISTLIST = Data.getArtist_list();
			List<String> IMGLIST = Data.getAlbum_img_list();
			List<String> TRACK_IDLIST = Data.getTrack_id_list();

//           System.out.println("곡 1의 정보");
//           System.out.println("TITLELIST 0  : " + TITLELIST.get(0));
//           System.out.println("ARTISTLIST 0 : " + ARTISTLIST.get(0));
//           System.out.println("IMGLIST 0 : " + IMGLIST.get(0));
//           System.out.println("TRACK_IDLIST 0 : " + TRACK_IDLIST.get(0));
//           
//           System.out.println("곡 2의 정보");
//           System.out.println("TITLELIST 1  : " + TITLELIST.get(1));
//           System.out.println("ARTISTLIST 1 : " + ARTISTLIST.get(1));
//           System.out.println("IMGLIST 1 : " + ARTISTLIST.get(1));
//           System.out.println("TRACK_IDLIST 1 : " + TRACK_IDLIST.get(1));
//           
//           System.out.println("곡 3의 정보");
//           System.out.println("TITLELIST 2  : " + TITLELIST.get(2));
//           System.out.println("ARTISTLIST 2 : " + ARTISTLIST.get(2));
//           System.out.println("IMGLIST 2 : " + IMGLIST.get(2));
//           System.out.println("TRACK_IDLIST 2 : " + TRACK_IDLIST.get(2));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Data;
	}

	// 플라스크 통신2 모델링에 사용할 곡 결정을 위해 spotify 곡id 보내기
	@RequestMapping(value = "/sendDataToFlask2", method = RequestMethod.POST)
	public List<Perfume> sendDataToFlask2(@RequestBody MyLog M_ID, HttpSession session) {
		System.out.println("sendDataToFlask2 시작");
		MyLog Data = null;
		List<Perfume> Plist = null;
		Log log = new Log();

		Member user = (Member) session.getAttribute("user");
		String id = user.getID();
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<MyLog> request = new HttpEntity<>(M_ID, headers);
		ResponseEntity<String> response = restTemplate.postForEntity("http://121.147.185.76:9000/sendDataToFlask2",
				request, String.class);
//       System.out.println("리스폰스 받음.");
		// python에서 나온 결과값(P_TYPE)으로 DB매칭
		String jsonString = response.getBody();
		ObjectMapper objectMapper = new ObjectMapper();

		try {
			// JSON 문자열을 객체로 파싱
			Data = objectMapper.readValue(jsonString, MyLog.class);
			// 파싱된 데이터 꺼내기 + 확인
			Plist = mapper.MatchP(Data.getP_TYPE()); // 분위기로 향수 매칭
			log.setID(id);
//          System.out.println(Data.getM_ID());
			log.setM_ID(Data.getM_ID());
			log.setM_ARTIST(Data.getM_ARTIST());
			log.setM_TITLE(Data.getM_TITLE());
			log.setM_IMG(Data.getM_IMG());
			log.setP_NUM1(Plist.get(0).getP_NUM());
			log.setP_NUM2(Plist.get(1).getP_NUM());
			log.setP_NUM3(Plist.get(2).getP_NUM());
			mapper.saveLog(log);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Plist;
	}

// 플라스크 통신3 탑, 미들, 베이스 노트를 입력받아 나온 타입으로 랜덤한 향수 3개 추천.
	@RequestMapping(value = "/sendDataToFlask3", method = RequestMethod.POST)
	public List<Perfume> sendDataToFlask3(@RequestBody Perfume p_note, HttpSession session) {
		MyLog Data = null;
		List<Perfume> Plist = null;

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<Perfume> request = new HttpEntity<>(p_note, headers);
		ResponseEntity<String> response = restTemplate.postForEntity("http://121.147.185.76:9000/sendDataToFlask3",
				request, String.class);
		System.out.println("리스폰스 받음.");
		String jsonString = response.getBody();
		ObjectMapper objectMapper = new ObjectMapper();

		try {
			// JSON 문자열을 객체로 파싱
			Data = objectMapper.readValue(jsonString, MyLog.class);
			// 파싱된 데이터 꺼내기 + 확인
			Plist = mapper.MatchP(Data.getP_TYPE()); // 분위기로 향수 매칭
			System.out.println(Plist.get(0));
			System.out.println(Plist.get(1));
			System.out.println(Plist.get(2));
//			Plist.get(2).getP_NUM());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Plist;
	}

	// 플라스크 통신4 track id받아서 특징 불러오기
	@RequestMapping(value = "/sendDataToFlask4", method = RequestMethod.POST)
	public Music sendDataToFlask3(@RequestBody Log M_ID) {
		System.out.println("sendDataToFlask4 시작");
		Music Data = null;

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<Log> request = new HttpEntity<>(M_ID, headers);
		ResponseEntity<String> response = restTemplate.postForEntity("http://121.147.185.76:9000/sendDataToFlask4", request, String.class);
		System.out.println("4 리스폰스 받음.");
		String jsonString = response.getBody();
		ObjectMapper objectMapper = new ObjectMapper();

		try {
			// JSON 문자열을 객체로 파싱
			Data = objectMapper.readValue(jsonString, Music.class);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Data;
	}

}