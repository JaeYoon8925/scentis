package kr.smhrd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.Log;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.MyLog;
import kr.smhrd.entity.Perfume;
import kr.smhrd.mapper.MemberMapper;


@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper mapper;

	// 메인화면 이동
	@RequestMapping("/")
	public String goMain() {
		return "MainPage";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("/Login")
	public String goLogin() {
		return "LoginPage"; 
	}
	
	// 음악으로 향수 추천받기 페이지 이동
	@RequestMapping("/goMusicPerfume")
	public String goMusicPerfume() {
		return "MusicPerfume";
	}
	// 향수결과 페이지 이동
	@PostMapping("/ResultPerfume")
	public String ResultPerfume() {
		return "MusicPerfume";
	}
	// 로그페이지 이동
	@RequestMapping("/goLogPage")
	public String goLogPage(Member user, Model model) {
	// 회원의 MyLog + 향수cnt 기준 best top3
		ArrayList<MyLog> log = mapper.LogCheck(user);
		model.addAttribute("Mylog",log);
		ArrayList<Log> log =  mapper.
		return "LogPage";
	}
	
	// 로그인
	@PostMapping("/Login")
	public String Login(Member member, HttpSession session) {
		Member user = mapper.Login(member);
		session.setAttribute("user",user);
		return "redirect:/";
	}
	// 로그아웃
	@RequestMapping("/logout")
	public String Logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	// 회원가입 페이지로
	 @RequestMapping("/Join")
	    public String goJoin() {
	        return "JoinPage";
	    }
	
	// 회원가입
	@PostMapping("/Join")
	public String Join(Member member) {
		System.out.println(member.getBIRTHDATE());
	int row=mapper.Join(member);
	if (row>0) {
		System.out.println("회원가입성공!");
		return "redirect://"; // 메인으로 이동
	}else {System.out.println("회원가입실패");
	return "redirect://Join";
	}
	}

	
	
	
	
}
