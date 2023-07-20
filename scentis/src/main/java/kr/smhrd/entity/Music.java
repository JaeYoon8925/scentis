package kr.smhrd.entity;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Music {
// 확인하고 클래스,DB 지워주세요 
	private int m_num;
	private String m_artist;
	private String m_title;
	private String m_genre;
	private BigDecimal m_freq;
	private BigDecimal m_beat;
	private String m_mood;
	
}
