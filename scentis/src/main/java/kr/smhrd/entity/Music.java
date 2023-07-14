package kr.smhrd.entity;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Music {

	private int m_num;
	private String m_artist;
	private String m_title;
	private String m_genre;
	private BigDecimal m_freq;
	private BigDecimal m_beat;
	private String m_mood;
	
}
