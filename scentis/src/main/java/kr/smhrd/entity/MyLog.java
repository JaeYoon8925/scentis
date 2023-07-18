package kr.smhrd.entity;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class MyLog {
// 마이로그에 넘겨줄 내용들 로그번호, 가수명, 노래제목, 향수번호, 결과향수, 향수사진
	private int LOG_NUM;
	private String ID;
	private String NICKNAME;
	private int M_TITLE;
	private int M_ARTIST;
	private int P_NUM;
	private String P_BRAND;
	private String P_MODEL;
	private String P_PICPATH; // 향수사진 정보
	private String P_INFO;    // 향수 정보
	
	// private int LOG_STF;   // 결과 만족도
	
}
