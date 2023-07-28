package kr.smhrd.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Mail {
	
	private String email;
	private String email_key;
	private Date issueDate;
	private Date expiredDate;
	
}
