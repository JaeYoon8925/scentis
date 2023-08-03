package kr.smhrd.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.smhrd.entity.Like;
import kr.smhrd.entity.Log;
import kr.smhrd.entity.Mail;
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

	// 회원가입시 인증코드 생성
	public int createEmailKey(Mail emailKeyBind) throws Exception;

	// 인증 시 유효기간 체크
	public Mail checkExp(Mail emailKeyBind) throws Exception;

	// ID, Email 유효 확인
	public int searchId(@Param("id") String id, @Param("email") String email) throws Exception;

	// 비밀번호 변경
	public int changePw(Member member) throws Exception;

	// 인증 여부 확인 >> 1=인증, 0=미인증
	public int checkEmailKey(Mail emailKeyBind) throws Exception;

	// 인증 완료후 DB에서 삭제
	public int deleteEmailKey(@Param("email") String email) throws Exception;

	// 아이디 중복 체크
	@Select("SELECT * FROM T_MEMBER WHERE ID=#{ID}")
	public Member idCheck(String id);

	// 로그보기, 아래 LogLoad와 LogLoadPInfo 로 기능 구현되서 미사용
	public ArrayList<MyLog> LogCheck(Member user);

	// 로그인된 계정의 로그 갯수 카운트
	public int count(String id);

	// 로그인된 계정의 모든 로그 정보 불러오기 @Param("endNo") int endNo
	public ArrayList<MyLog> getLogList(@Param("ID") String ID, @Param("startNo") int startNo);

	// 각 로그별 향수 1 2 3 의 정보 불러오기
	@Select("SELECT * FROM T_PERFUME WHERE P_NUM IN (#{num1}, #{num2}, #{num3})")
	public ArrayList<Perfume> LogP(@Param("num1") int num1, @Param("num2") int num2, @Param("num3") int num3);

	// 향수 모두 가져오기
	@Select("SELECT * FROM T_PERFUME WHERE P_BRAND=#{name} ORDER BY P_MODEL ASC")
	public ArrayList<Perfume> AllP(String name);

	// top,mid,base 가져오기
	@Select("SELECT DISTINCT P_TOP FROM T_PERFUME ORDER BY P_TOP ASC")
	public ArrayList<Perfume> MixTop();

	@Select("SELECT DISTINCT P_MIDDLE FROM T_PERFUME ORDER BY P_MIDDLE ASC")
	public ArrayList<Perfume> MixMid();

	@Select("SELECT DISTINCT P_BASE FROM T_PERFUME ORDER BY P_BASE ASC")
	public ArrayList<Perfume> MixBase();

	// 타입에 맞는 향수 3개 랜덤 매칭
	@Select("SELECT * FROM T_PERFUME WHERE P_TYPE = #{P_TYPE} ORDER BY RAND() LIMIT 3")
	public ArrayList<Perfume> MatchP(int P_TYPE);
	
	// 향수 TOP,MIDDLE,BASE 선택
	@Select("SELECT * FROM T_PERFUME WHERE P_TOP =#{P_TOP} AND P_MIDDLE =#{P_MIDDLE} AND P_BASE =#{P_BASE} LIMIT 3")
	public ArrayList<Perfume> selectP(Perfume P_note);
	
	// 로그저장
	public void saveLog(Log log);

	// 좋아요 향수 가져오기
	public ArrayList<Perfume> LikeP(List<String> list);

	@Select("SELECT P_MODEL FROM T_LIKE WHERE ID=#{ID}")
	public List<String> AllL(String ID);

	// 찜여부 확인
	@Select("SELECT * FROM T_LIKE WHERE ID=#{ID} AND P_MODEL=#{P_MODEL}")
	public Like likeYN(Like l);

	// 찜기능
	@Insert("INSERT INTO T_LIKE VALUES(#{ID}, #{P_MODEL})")
	public int like(Like l);

	// 찜삭제기능
	@Delete("DELETE FROM T_LIKE WHERE ID=#{ID} AND P_MODEL = #{P_MODEL}")
	public int dislike(Like l);
}