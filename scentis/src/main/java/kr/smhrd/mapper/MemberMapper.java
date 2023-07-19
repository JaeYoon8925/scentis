package kr.smhrd.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.smhrd.entity.Member;
import kr.smhrd.entity.MyLog;
import kr.smhrd.entity.Perfume;

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
	
	// trend perfume가져오기
	public ArrayList<Perfume> TrendP();
	
	// test용
	public ArrayList<Perfume> AllP();
}
