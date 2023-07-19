package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Log {

	private int LOG_NUM;
	private String ID;
	private String M_TITLE;
	private String M_ARTIST;
	private int P_NUM;
	private int LOG_STF;  //향수만족도
}
