package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Perfume {

	private String P_NUM;
	private String P_BRAND;
	private String P_MODEL;
	private String P_TOP; 
	private String P_MIDDLE; 
	private String P_BASE; 
	private String P_INFO; 
	private String P_TYPE;    // 향
	private String P_MOOD;    // 분위기
	private String P_PATH;    // 향수 설명 사이트 정보
	private String P_PICPATH; // 향수사진 정보
	private int P_CNT;        // 결과로 향수가 나온 횟수
	
}
