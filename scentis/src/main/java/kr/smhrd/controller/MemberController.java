package kr.smhrd.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Member;
import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 처음 서버 부팅시
	@RequestMapping(value = "/")
	public String index() {
		ArrayList<Member> members = new ArrayList<>();
		members = memberService.test();
		System.out.println(members);
		return "mainPage";
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/login")
	public String goLogin() {
		
		return "loginPage"; // 이동시켜줄 페이지 이름
	}
	
	// 회원가입 페이지로
	 @GetMapping("/registerPage")
	    public String goRegisterPage() {
	        return "registerPage";
	    }
	
	// 회원가입
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(@RequestParam("pwCheck") String pwCheck, Member member, Model model) {
		String goal = "";
		
		
		
		// 회원가입 시도
		System.out.println("회원가입 컨트롤러");
		int result = memberService.register(member);
		
		if (result > 0 ) {
			System.out.println("회원가입 성공");
			goal = "loginPage"; // 성공시 로그인 시도하라고 이동
		} else {
			System.out.println("회원가입 실패");
			goal = "registerPage"; // 실패하면 다시 가입시도 > 아직 안만듬 
		}
		
		return goal; // 이동시켜줄 페이지 이름
	}
	
	// 회원가입 시에 사용할 아이디 중복 체크
	@RequestMapping(value = "/dupCheck", method = RequestMethod.POST)
	@ResponseBody
	public String dupCheck(String id) throws Exception{
		System.out.println("dupCheck() 진입");
		String result = "";
		int one = memberService.dupCheck(id);
		
		if ( one == 1 ) {
			// 중복
			result = "fail";
		} else {
			// 중복 아님
			result = "success";
		}
		
		
		return result;
		
		
		
	}
	
	// 회원가입 시 비밀번호 확인
	
	

	
	
	
	
}
