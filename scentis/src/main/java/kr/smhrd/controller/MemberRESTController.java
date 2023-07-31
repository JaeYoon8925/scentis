package kr.smhrd.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.smhrd.entity.Like;
import kr.smhrd.entity.Log;
import kr.smhrd.entity.Mail;
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
   // 좋아요기능
   @RequestMapping("/like")
   public int Like(String P_MODEL, HttpSession session) {
      Member user = (Member) session.getAttribute("user");
      Like l = new Like(user.getID(), P_MODEL);
      Like re = mapper.likeYN(l);
      if (re==null) {
         int row = mapper.like(l); // 좋아요
         return 1;
      } else {
         int row = mapper.dislike(l); // 싫어요기능
         return -1;
      }
   }
   
   // 이메일 인증키 생성 및 전송
   @GetMapping("/createMailKey")
   @ResponseBody
   public String createMailKey(String email) throws Exception {
      System.out.println("이메일 인증 요청이 들어옴!");
      System.out.println("이메일 인증 이메일 : " + email);

      // 이전에 같은 메일에 생성된 키 삭제
      mapper.deleteEmailKey(email);
      System.out.println("코드삭제");

      Calendar cal1 = Calendar.getInstance();
      cal1.add(Calendar.MINUTE, 3); // 분 연산
      Date calDate = new Date(cal1.getTimeInMillis());
      Date date = new Date();

      // 랜덤 문자열을 생성해서 email_key 컬럼에 넣어주기
      String email_key = service.getKey();
      System.out.println("생성된 인증키 : " + email_key);

      Mail emailKeyBind = new Mail();
      emailKeyBind.setEmail(email);
      emailKeyBind.setEmail_key(email_key);
      emailKeyBind.setIssueDate(date); // 인증키 발급시간
      emailKeyBind.setExpiredDate(calDate); // 인증키 유효시간

      // 인증코드 생성
      mapper.createEmailKey(emailKeyBind);
      System.out.println("인증키 생성");

      // 메일전송
      String result = service.sendMail(email, email_key);
      System.out.println("result : " + result);

      return result;
   }

   // 이메일 인증키 체크
   @GetMapping("/checkMailKey")
   @ResponseBody
   public String checkMailKey(String email, String email_key) throws Exception {
      System.out.println("인증키 확인 시도");
      System.out.println("입력받은 인증키 : " + email_key);
      System.out.println("입력받은 이메일 : " + email);

      Mail emailKeyBind = new Mail();
      emailKeyBind.setEmail(email);
      emailKeyBind.setEmail_key(email_key);

      Mail checkExp = mapper.checkExp(emailKeyBind);

      // 시간 비교 ( 0 이하 = exp 타임이 지난 후 / 0 초과 = exp 타임이 지나기 전)
      Date date = new Date();
      Date expDate = checkExp.getExpiredDate();
      int expResult = expDate.compareTo(date);

      System.out.println(checkExp);
      System.out.println(expDate);
      System.out.println(expResult);
      System.out.println(emailKeyBind);

      if (0 < expResult) {
         int checkResult = mapper.checkEmailKey(emailKeyBind);
         System.out.println(checkResult);

         if (checkResult == 1) {
            mapper.deleteEmailKey(email);
            System.out.println("코드삭제");
            return "true"; // 성공
         } else {
            return "false1"; // 인증키 오류
         }
      }
      return "flase2"; // 타임아웃
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

      System.out.println(jsonString);

      try {
         // JSON 문자열을 객체로 파싱
         Data = objectMapper.readValue(jsonString, MyLog.class);
         // 파싱된 데이터 꺼내기 + 확인
         Plist = mapper.MatchP(Data.getP_TYPE()); // 분위기로 향수 매칭
         log.setID(id);
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
//         System.out.println(Plist.get(0));
//         Plist.get(2).getP_NUM());
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
      ResponseEntity<String> response = restTemplate.postForEntity("http://121.147.185.76:9000/sendDataToFlask4",
            request, String.class);
      System.out.println("4 리스폰스 받음.");
      String jsonString = response.getBody();
      ObjectMapper objectMapper = new ObjectMapper();
      try {
         // JSON 문자열을 객체로 파싱
         Data = objectMapper.readValue(jsonString, Music.class);
         System.out.println(Data);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return Data;
   }

}