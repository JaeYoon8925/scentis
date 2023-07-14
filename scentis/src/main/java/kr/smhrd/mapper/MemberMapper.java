package kr.smhrd.mapper;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.smhrd.entity.Member;

@Repository
public interface MemberMapper {
	
	// 테스트
	public ArrayList<Member> test();

	// 로그인
	public Member login(Member member);
	
	// 오티피 생성문
	public int register(Member member);
	
	// 아이디 중복 체크
	public int dupCheck(String id);
	
//	// 아이디 존재 확인
//	public accountTable accountCheck(accountTable account);
//
//	
//	
//	// 오티피 체크문
//	public int otpCheck(otpTable otp);
//	
//	// 오티피 딜리트 문
//	public int otpDelete(otpTable otp);
//
//	@Update("UPDATE accountTable SET blockTime = 0 WHERE id=#{id}")
//	
//	// 로그인 카운트 조회
//	public int loginCntCheck(accountTable account);
//	// 로그인 카운트 +
//	public void loginCntUpdate(accountTable account);
//	// 블록타임 업데이트
//	public int blockTimeUpdate(accountTable account);
	
	
	
	
}
