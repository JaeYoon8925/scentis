package kr.smhrd.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Member {

	private String id;
	private String pw;
	private String name;
	private String nickname;
	private Date birthdate;
	private String gender; 
	// 자바의 date 타입은 mysql에서 db 생성시에는 DATETIME 타입으로 선언 필요.
	
}
