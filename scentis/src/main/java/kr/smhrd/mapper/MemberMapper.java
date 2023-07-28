package kr.smhrd.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

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
   
//////////////////////////////////////////////////////////////////////////////////////////////////   
   
   // 회원가입시 인증코드 생성
   public int createEmailKey(Mail emailKeyBind) throws Exception;
   
   // 인증 시 유효기간 체크
   public Mail checkExp(Mail emailKeyBind) throws Exception;
   
   // 인증 여부 확인 >> 1=인증, 0=미인증
   public int checkEmailKey(Mail emailKeyBind) throws Exception;
   
   // 인증 완료후 DB에서 삭제
   public int deleteEmailKey(@Param("email") String email) throws Exception;
   
//////////////////////////////////////////////////////////////////////////////////////////////////
   
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
   
//   // random perfume 하나씩 가져오기
//   @Select("SELECT * FROM T_PERFUME ORDER BY RAND() LIMIT 1")
//   public Perfume RecP();
   
    // 향수 모두 가져오기
    @Select("SELECT * FROM T_PERFUME WHERE P_BRAND=#{name}")
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
   
   // TOP MIDDLE BASE NOTE 에 정확하게 맞는 향수 검색
   public ArrayList<Perfume> searchP(Perfume p_note);
   
   // 로그저장
   public void saveLog(Log log);
}