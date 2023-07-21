package kr.smhrd.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
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
	
	// 로그보기, 아래 LogLoad와 LogLoadPInfo 로 기능 구현되서 미사용
	public ArrayList<MyLog> LogCheck(Member user);
	
	// 로그인된 계정의 모든 로그 정보 불러오기
	public ArrayList<MyLog> LogLoad(String id);
	
	// 각 로그별 향수 1 2 3 의 정보 불러오기
	public ArrayList<Perfume> LogLoadPInfo(@Param("num1") int num1, @Param("num2") int num2, @Param("num3") int num3);
	
	// random perfume 하나씩 가져오기
	@Select("SELECT * FROM T_PERFUME ORDER BY RAND() LIMIT 1")
	public Perfume RecP();
	
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
	
	// 타입에 맞는 향수 3개 랜덤 매칭
	@Select("SELECT * FROM T_PERFUME WHERE P_TYPE = #{P_TYPE} ORDER BY RAND() LIMIT 3")
	public ArrayList<Perfume> MatchP(MyLog log);
	
//	// 로그저장
//	public void saveLog(MyLog log);
}
