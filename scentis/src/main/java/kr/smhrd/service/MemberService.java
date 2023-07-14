package kr.smhrd.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.entity.Member;
import kr.smhrd.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired(required = false)
	private MemberMapper memberMapper;

	// 테스트
	public ArrayList<Member> test() {
		ArrayList<Member> members = new ArrayList<>();
		members = memberMapper.test();
		
		return members;
	}

	// 로그인
	public Member login(Member member) {
		Member info = memberMapper.login(member);

		return info;
	}

	// 회원가입
	public int register(Member member) {
		System.out.println("회원가입 서비스");
		int result = memberMapper.register(member);
		
		return result;
	}
	
	// 아이디 중복확인
	public int dupCheck(String id) {
		System.out.println("id 중복확인 서비스");
		int result = memberMapper.dupCheck(id);
		
		return result;
	}
	

}
