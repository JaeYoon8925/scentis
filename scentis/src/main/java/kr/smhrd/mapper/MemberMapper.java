package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.smhrd.entity.Member;

@Repository
public interface MemberMapper {
	
	// 로그인
	public Member Login(Member member);
	
	// 회원가입
	public int Join(Member dto);
	
	// 아이디 중복 체크
	@Select("SELECT * from T_MEMBER WHERE id=#{id}")
	public Member idCheck(String id);
	
	
	
}
