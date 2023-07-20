package kr.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

@RestController // @Controller + @ResponseBody 비동기통신 controller
public class MemberRESTController {

	@Autowired
	private MemberMapper mapper;

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
	
	// perfumeList 비동기로 보내주기
	@RequestMapping("/BrandP")
	public ArrayList<Perfume> AllP(String P_BRAND) {
		ArrayList<Perfume> Pdata = mapper.AllP();
		return Pdata;
	}
	
	// 플라스크 통신
	@RequestMapping(value = "/sendDataToFlask", method = RequestMethod.POST)
	public MyLog sendDataToFlask(@RequestBody MyLog title) {
	    System.out.println("sendDataToFlask 시작");
	    // Music 객체를 JSON으로 변환하여 Flask 서버에 전송
	    RestTemplate restTemplate = new RestTemplate();
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    
	    HttpEntity<MyLog> request = new HttpEntity<>(title, headers);
	    
	    ResponseEntity<String> response = restTemplate.postForEntity("http://121.147.185.76:9000/sendDataToFlask", request, String.class);
	    
	    System.out.println(response.getBody().getClass()); // String 타입
	    
	    // JSON 문자열
	    String jsonString = response.getBody();
	    System.out.println(jsonString);
	    
	    // Jackson ObjectMapper 객체 생성
	    ObjectMapper objectMapper = new ObjectMapper();
	    MyLog Data = null;
	    try {
	        // JSON 문자열을 객체로 파싱
	    	Data = objectMapper.readValue(jsonString, MyLog.class);
	    	
	    	System.out.println(Data);
	    	
	        // 파싱된 데이터 꺼내기 + 확인
	        List<String> TITLELIST = Data.getTitle_list();
	        List<String> ARTISTLIST = Data.getArtist_list();
	        List<String> IMGLIST = Data.getAlbum_img_list();
	        List<String> TRACK_IDLIST = Data.getTrack_id_list();
	       
	        System.out.println("곡 1의 정보");
	        System.out.println("TITLELIST 0  : " + TITLELIST.get(0));
	        System.out.println("ARTISTLIST 0 : " + ARTISTLIST.get(0));
	        System.out.println("IMGLIST 0 : " + IMGLIST.get(0));
	        System.out.println("TRACK_IDLIST 0 : " + TRACK_IDLIST.get(0));
	        
	        System.out.println("곡 2의 정보");
	        System.out.println("TITLELIST 1  : " + TITLELIST.get(1));
	        System.out.println("ARTISTLIST 1 : " + ARTISTLIST.get(1));
	        System.out.println("IMGLIST 1 : " + ARTISTLIST.get(1));
	        System.out.println("TRACK_IDLIST 1 : " + TRACK_IDLIST.get(1));
	        
	        System.out.println("곡 3의 정보");
	        System.out.println("TITLELIST 2  : " + TITLELIST.get(2));
	        System.out.println("ARTISTLIST 2 : " + ARTISTLIST.get(2));
	        System.out.println("IMGLIST 2 : " + IMGLIST.get(2));
	        System.out.println("TRACK_IDLIST 2 : " + TRACK_IDLIST.get(2));

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return Data;
	}

//	// 월별 데이터 조회할 수 있는 url
//		@RequestMapping("/getMonthData")
//		public ArrayList<BroadCast> getMonthData(String name) {
//			System.out.println("요청이 들어왔나");
//			
//			//1. db에서 월별 전체시청률 평균 조회해오기
//			//db -> mapper interface -> 메소드 틀 제작 -> xml sql 구문
//			ArrayList<BroadCast> result = mapper.getMonthData(name);
//			//2. 조회한 결과값을 return 반환시켜주기
//			
//			return result;
//			
//		}
//		//연령대별 데이터 조회
//		@RequestMapping("/getAgeData")
//		public BroadCast getAgeData() {
//			System.out.println("요청이 들어왔을까나~");
//			BroadCast result = mapper.getAgeData();
//			return result;
//		}
//		//출연진 5
//		@RequestMapping("/getCastCount")
//		public ArrayList<CastCount> getCastCount(String program_nm) {
//			//1. DB에서 데이터 조회
//			ArrayList<BroadCast> result = mapper.getCastCount(program_nm);
//			//2. 조회한 결과값 화면에 출력될 수 있는 형태로 변환(전처리)
//			// 1개의 column안에 여러명의 이름이 들어있음
//			// 연예인 이름을 전부 담을 수 있는 ArrayList<String> 생성
//			ArrayList<String> cast_nm = new ArrayList<String>();
//			
//			for(BroadCast b :result) {
//				//2-1) result 안에 들어있는 MC 이름을 가져와서 , 를 기준으로 쪼개기
//				String[] temp1 = b.getFixing_cast_nm().split(",");
//				//2-2) result 안에 들어있는 cast_nm을 가져와서 ,를 기준으로 쪼개기
//				String[] temp2 = b.getCast_nm().split(",");
//				//2-3) 쪼갠 데이터들을 하나의 공간에 보관
//				for(String s:temp1) {
//					cast_nm.add(s);
//				}
//				for(String s:temp2) {
//					cast_nm.add(s);
//				}
//			}
//			System.out.println("연예인명단>>" + cast_nm);
//			
//			//2-4) 전체 연예인 명단에서 중복을 제거
//			// Collection --> 객체 자료구조(ArrayList, List, HashMap...)
//			// HashSet --> 중복값을 허용하지 않는 자료구조 => 데이터를 꺼내려면 iterator 사용
//			//LinkedHashSet --> 순서가 있는 중복값을 허용하지 않는 자료구조
//			LinkedHashSet<String> castingHashSet = new LinkedHashSet<String>(cast_nm);
//			System.out.println("중복제거한 결과값 >> "+castingHashSet);
//			//2-5) 최종적으로 리턴해줄 자료형
//			//CastCount --> 이름:횟수
//			//2-6) 연예인 이름 당 몇번 등장했는지 횟수 카운트
//			//Collections.frequency(객체를 담고 있는 컬렉션, 개수를 세고 싶은 객체)
//			//2-7) 결과값을 resultList 담아주기
//			ArrayList<CastCount> resultList = new ArrayList<CastCount>();
//			// resultList.add(new CastCount("수빈",count));
//			for(String s : castingHashSet) {
//				if (!s.equals("")) {
//					int count = Collections.frequency(cast_nm,s);
//					resultList.add(new CastCount(s,count));
//				}
//			}
//			//2-8) resultList 정렬
//			//--> 객체를 정렬 --> count 기준으로 정렬
//			// 객체를 정렬하는 방법
//			//(1) 정렬하고 싶은 객체가 Comparable 인터페이스를 상속
//			//(2) Comparator라는 인터페이스 구현 **사용**
////			Collections.sort(resultList, new Comparator<CastCount>() {
////
////				// compare --> 비교하는 함수
////				@Override
////				public int compare(CastCount o1, CastCount o2) {
////					return o2.getCount() - o1.getCount();
////					// 양수 => 내름차순 정렬
////					// 음수 => 오림차순 정렬
////				}
////			
////			});
//			
//			// 람다식 표현 --> 익명함수를 호출할 때 많이 사용하는 방식
//			// (매개변수) -> 리턴해줘야하는 결과값
//			Collections.sort(resultList, (o1,o2)->o2.getCount()-o1.getCount());
//			
//			System.out.println("최종결과>>" + resultList);
//			
//			
//			return resultList;
//		}
//	
}
