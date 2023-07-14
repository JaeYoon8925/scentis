package kr.smhrd.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.entity.Member;
import kr.smhrd.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired(required=false)
	private MemberMapper mapper;

	public ArrayList<Member> test() {
		
		ArrayList<Member> members = new ArrayList<>();
		members = mapper.test();
		return members;
	}

	public Member login(Member account) {
		
		
		
		return null;
	}
	
}
