package kr.smhrd.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.smhrd.entity.Log;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.MyLog;

@Repository
public interface MemberMapper {

	// 로그인
	@Select("SELECT * FROM T_MEMBER WHERE ID=#{ID} AND PW=#{PW}")
	public Member Login(Member member);
	
	// 회원가입
	public int Join(Member dto);
	
	// 아이디 중복 체크
	@Select("SELECT * FROM T_MEMBER WHERE ID=#{ID}")
	public Member idCheck(String id);
	
	// 로그보기
	public ArrayList<MyLog> LogCheck(Member user);
	
}
