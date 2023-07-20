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
	@Select("SELECT * FROM T_PERFUME ORDER BY P_CNT DESC LIMIT 3")
	public ArrayList<Perfume> TrendP();
	
   // 향수 모두 가져오기
   @Select("SELECT * FROM T_PERFUME WHERE P_BRAND=#{name}")
   public ArrayList<Perfume> AllP(String name);
	
	// top,mid,base 가져오기
	@Select("SELECT DISTINCT P_TOP FROM T_PERFUME")
	public ArrayList<Perfume> MixTop();
	@Select("SELECT DISTINCT P_MIDDLE FROM T_PERFUME")
	public ArrayList<Perfume> MixMid();
	@Select("SELECT DISTINCT P_BASE FROM T_PERFUME")
	public ArrayList<Perfume> MixBase();
}
