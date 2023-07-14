package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Perfume {

	private String p_num;
	private String p_brand;
	private String p_model;
	private String p_top; 
	private String p_middle; 
	private String p_base; 
	private String p_mood; 
	private String p_picpath;
	private String p_info; 
	private String p_path;
	
}
