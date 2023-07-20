package kr.smhrd.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class MyLog {
// 마이로그에 넘겨줄 내용들 로그번호, 가수명, 노래제목, 향수번호, 결과향수, 향수사진
// DB 테이블 생성X
	private int LOG_NUM;
	private String ID;
	private String NICKNAME;
	private String M_ARTIST; 
	private String M_TITLE; 
	private int P_NUM;
	private String P_BRAND;
	private String P_MODEL;
	private String P_INFO;    // 향수 정보
	private String M_IMG;     // 앨범이미지
	
	
//	private int M_TRACK_ID; // 스포티파이의 트랙ID
	private List<String> title_list;
	private List<String> artist_list;
	private List<String> album_img_list;
	private List<String> track_id_list;

	
	// private int LOG_STF;   // 결과 만족도
	
}
