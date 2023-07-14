package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Music {

	private int M_NUM;
	private String M_ARTIST;
	private String M_TITLE;
	private String M_GENRE;
	private String M_FREQ;
	private String M_BEAT;
	private String M_MOOD;
	
}
