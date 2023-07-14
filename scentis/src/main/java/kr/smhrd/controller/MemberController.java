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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String index(Member member, Model model) {
		String goal = "loginPage"; // 로그인을 시도했던 페이지의 주소 정보를 가져와서 선언하는 것으로 변경
		
		// 로그인 시도
		System.out.println("로그인 시도");
		Member info = memberService.login(member);
		
			// 로그인 성공
			if (info != null) {
				// 모델에 로그인 정보 저장. (유지해야하니 안되는 경우 세션에 저장하는 것으로 변경)
				System.out.println("로그인 성공");
				System.out.println(info);
				model.addAttribute("account", info);
			}
			// 로그인 실패 info = null
			else {
				System.out.println("아이디 또는 비밀번호 오류 / 로그인 실패");
				goal = "loginPage"; // 로그인 전용 창으로 이동시켜줄까? 아니면 그냥 시도했던 페이지에 그대로 놔둘거면 이거 필요없음.
			}
			
		return goal; // 이동시켜줄 페이지 이름
	}

	// 회원가입
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String register(Member member, Model model) {
		String goal = "loginPage";
		
		
		
		return goal; // 이동시켜줄 페이지 이름
	}
	
}
