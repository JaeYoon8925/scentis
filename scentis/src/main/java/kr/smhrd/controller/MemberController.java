package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.smhrd.entity.Member;
import kr.smhrd.mapper.MemberMapper;


@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper mapper;

	// 처음 서버 부팅시
	@RequestMapping("/")
	public String goMain() {
		return "MainPage";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("/login")
	public String goLogin() {
		return "LoginPage"; // 이동시켜줄 페이지 이름
	}
	
	// 로그인
	@PostMapping(value = "/login")
	public String Login(Member member, Model model) {
		Member dto = mapper.Login(member);
		model.addAttribute(dto);
		return "redirect://";
	}
	
	// 회원가입 페이지로
	 @RequestMapping("/Join")
	    public String goJoin() {
	        return "JoinPage";
	    }
	
	// 회원가입
	@RequestMapping(value = "/Join", method = RequestMethod.POST)
	public String Join(Member member) {
	int row=mapper.Join(member);
	if (row>0) {
		System.out.println("회원가입성공!");
		return "redirect://"; // 메인으로 이동
	}else {System.out.println("회원가입실패");
	return "redirect://Join";
	}
	}
	
	
	
	
}
