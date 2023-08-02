package kr.smhrd.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {

	private String ID;
	private String PW;
	private String NAME;
	private String NICKNAME;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date BIRTHDATE;
	private String GENDER;
	private String EMAIL;
	// 자바의 date 타입은 mysql에서 db 생성시에는 DATETIME 타입으로 선언 필요.

}
