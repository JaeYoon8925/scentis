package kr.smhrd.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.entity.Member;
import kr.smhrd.entity.Perfume;
import kr.smhrd.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired // (required = false)
	private MemberMapper mapper;

//	public Perfume RecP() {
//		Perfume RecP = mapper.RecP();
//		return RecP;
//	}
	
	// 로그인 여부 확인. 로그인된 경우 1 아닌경우 0 리턴.
	public int loginCheck(HttpSession session) {
		if ((Member) session.getAttribute("user") == null) {
			return 0;
		}
		return 1;
	}
	
//	// 테스트
//	public ArrayList<Member> test() {
//		ArrayList<Member> members = new ArrayList<>();
//		members = memberMapper.test();
//		
//		return members;
//	}
//
//	// 로그인
//	public Member login(Member member) {
//		Member info = memberMapper.login(member);
//
//		return info;
//	}
//
//	// 회원가입
//	public int register(Member member) {
//		System.out.println("회원가입 서비스");
//		int result = memberMapper.register(member);
//		
//		return result;
//	}
//	
//	// 아이디 중복확인
//	public int dupCheck(String id) {
//		System.out.println("id 중복확인 서비스");
//		int result = memberMapper.dupCheck(id);
//		return result;
//	}
//	


}
