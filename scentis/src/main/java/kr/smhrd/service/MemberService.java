package kr.smhrd.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.entity.Member;
import kr.smhrd.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired(required=false)
	private MemberMapper memberMapper;

	public ArrayList<Member> test() {
		
		ArrayList<Member> members = new ArrayList<>();
		members = memberMapper.test();
		return members;
	}

	public Member login(Member member) {
		
		Member info = memberMapper.login(member);
		
		return info;
	}
	
}
