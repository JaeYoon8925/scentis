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
import kr.smhrd.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper mapper;
	@Autowired
	private MemberService service;

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

	// Allperfume페이지 이동
	@RequestMapping("/AllP")
	public String goAllP(HttpSession session) {
		int loginCheck = service.loginCheck(session);
		if (loginCheck == 0) {
			return "LoginPage";
		}
		return "AllPerfume";
	}

	// 음악으로 향수 추천받기 페이지 이동
	@RequestMapping("/goMusicPerfume")
	public String goMusicPerfume(HttpSession session, Model model) {
		int loginCheck = service.loginCheck(session);
		if (loginCheck == 0) {
			return "LoginPage";
		}
		
		Perfume RecP = service.RecP();
		model.addAttribute("RecP", RecP);
		return "MusicPerfume";
	}

	// 로그페이지 이동
	@RequestMapping("/goLogPage")
	public String goLogPage(HttpSession session, Member user, Model model) {
		int loginCheck = service.loginCheck(session);
		if (loginCheck == 0) {
			return "LoginPage";
		}
		
		Member loginUser = (Member) session.getAttribute("user");
		String id = loginUser.getID();
		
		ArrayList<MyLog> log = mapper.LogLoad(id);
		model.addAttribute("log", log);

		Perfume RecP = service.RecP();
		model.addAttribute("RecP", RecP);
		return "LogPage";
	}

//      int i=0;
//      ArrayList<ArrayList<Perfume>> logListPerfume = new ArrayList<ArrayList<Perfume>>();
//      
//      for (MyLog logList : log) {
//         i++;
//         System.out.println(logList);
//         int num1 = logList.getP_NUM1();
//         int num2 = logList.getP_NUM2();
//         int num3 = logList.getP_NUM3();
//
//         ArrayList<Perfume> logPerfume = mapper.LogLoadPInfo(num1, num2, num3);
////         System.out.println(logPerfume);
////         System.out.println(logPerfume.get(0));
////         System.out.println(logPerfume.get(1));
////         System.out.println(logPerfume.get(2));
////         System.out.println();
//         
//         logListPerfume.add(logPerfume);
//         
//         if (log.size() == i) {
//            session.setAttribute("logListPerfume", logListPerfume);
//            System.out.println(logListPerfume);
//         }      

//      MyLog b = log.get(0);
//      int P_num1 = b.getP_NUM1();
//
//      System.out.println(b);
//      System.out.println(P_num1);

	// 향선택 향수 찾기 페이지 이동
	@RequestMapping("/ScentP")
	public String MixP(HttpSession session, Model model) {
		int loginCheck = service.loginCheck(session);
		if (loginCheck == 0) {
			return "LoginPage";
		}
		
		Perfume RecP = service.RecP();
		model.addAttribute("RecP", RecP);
		ArrayList<Perfume> Top = mapper.MixTop();
		ArrayList<Perfume> Mid = mapper.MixMid();
		ArrayList<Perfume> Base = mapper.MixBase();
		model.addAttribute("Ptop", Top);
		model.addAttribute("Pmid", Mid);
		model.addAttribute("Pbase", Base);
		return "ScentPerfume";
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
			return "redirect:/"; // 회원가입 성공 시 메인으로 이동
		} else
			return "redirect:/Join"; // 실패

	}

}