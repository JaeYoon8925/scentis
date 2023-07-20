package kr.smhrd.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class MyLog {
// DB 테이블 생성X
// 마이로그에 볼때 필요한 내용 : 로그번호, 가수명, 노래제목, 향수1,향수2,향수3, 향수명, 향수사진
// DB에 Log입력 : 로그번호,id,가수,제목,앨범이미지,향수1,향수2,향수3,향수만족도,type
	private int LOG_NUM;
	private String ID;
	private String NICKNAME;
	private String M_ARTIST; 
	private String M_TITLE; 
	private int P_NUM1;
	private int P_NUM2;
	private int P_NUM3;
	private String P_TYPE;    // 향 ( 모델에서 매칭시킬 내용 )
	private String P_BRAND;
	private String P_MODEL;
	private String P_INFO;    // 향수 정보
	private String M_IMG;     // 앨범이미지
	private int LOG_STF;      // 결과 만족도
	
	
//	private int M_TRACK_ID; // 스포티파이의 트랙ID
	private List<String> title_list;
	private List<String> artist_list;
	private List<String> album_img_list;
	private List<String> track_id_list;
	
	
}
