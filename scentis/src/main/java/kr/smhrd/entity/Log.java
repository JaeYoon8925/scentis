package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Log {
// 로그 저장될 DB내용
	private int LOG_NUM;    // 로그번호
	private String ID;      // 회원ID
	private String M_TITLE; // 노래제목
	private String M_ARTIST;// 노래가수
	private String M_IMG;   // 앨범이미지 저장..?? 
	private int P_NUM;      // 향수번호
	private int LOG_STF;    // 향수만족도
}
