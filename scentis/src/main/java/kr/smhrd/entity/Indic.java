package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Indic {

	private int I_NUM;
	private String M_GENRE;
	private int MAX_FREQ;
	private int MIN_FREQ;
	private int MAX_BEAT; 
	private int MIN_BEAT; 
	
}
