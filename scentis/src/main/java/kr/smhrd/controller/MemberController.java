package kr.smhrd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "MainPage";	}

	// 로그인 페이지로 이동
	@RequestMapping("/Login")
	public String goLogin() {
		return "LoginPage";	}

	// 음악으로 향수 추천받기 페이지 이동
	@RequestMapping("/goMusicPerfume")
	public String goMusicPerfume(Model model) {
		ArrayList<Perfume> TrendP = mapper.TrendP();
		model.addAttribute("TrendP", TrendP);
		return "MusicPerfume";	}

	// 향수결과 페이지 이동
	@PostMapping("/ResultPerfume")
	public String ResultPerfume() {
		return "MusicPerfume";	}

	// 로그페이지 이동
	@RequestMapping("/goLogPage")
	public String goLogPage(Member user, Model model) {
		// 회원의 MyLog + 향수cnt 기준 best top3
		ArrayList<MyLog> Mylog = mapper.LogCheck(user);
		model.addAttribute("Mylog", Mylog);
		ArrayList<Perfume> TrendP = mapper.TrendP();
		model.addAttribute("TrendP", TrendP);
		return "LogPage";	}

	// 종류별 향수 보기 페이지 이동
	@RequestMapping("/AllP")
	public String AllP(Model model) {
		ArrayList<Perfume> Pdata = mapper.AllP();
		model.addAttribute("Pdata",Pdata);
		return "AllPerfume";
	}
	
	// 로그인
	@PostMapping("/Login")
	public String Login(Member member, HttpSession session) {
		Member user = mapper.Login(member);
		session.setAttribute("user", user);
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
		int row = mapper.Join(member);
		if (row > 0) {
			return "redirect://"; // 회원가입 성공 시 메인으로 이동
		} else
			return "redirect://Join"; // 실패

	}

}
