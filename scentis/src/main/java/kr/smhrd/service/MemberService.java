package kr.smhrd.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.smhrd.entity.Mail;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.Perfume;
import kr.smhrd.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	// 로그인 여부 확인. 로그인된 경우 1 아닌경우 0 리턴.
	public int loginCheck(HttpSession session) {
		if ((Member) session.getAttribute("user") == null) {
			return 0;
		}
		return 1;
	}

	public int createMailKey(Mail emailKeyBind) throws Exception {
		return mapper.createEmailKey(emailKeyBind);
	}

	public int checkMailKey(Mail emailKeyBind) throws Exception {
		return mapper.checkEmailKey(emailKeyBind);
	}

	public String getKey() {
		Random random = new Random();
		String email_key = "";
		for (int i = 1; i < 7; i++) {
			email_key = email_key + String.valueOf(random.nextInt(10));
		}
		return email_key;
	}

	public String sendMail(String email, String emailKey) {
		try {
			JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			mailSender.setHost("smtp.gmail.com");
			mailSender.setPort(587);
			mailSender.setUsername("4yuiko07@gmail.com"); // Gmail 계정
			mailSender.setPassword("abedrslxjbckvhla");   // Gmail 앱 비밀번호

			Properties props = mailSender.getJavaMailProperties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.debug", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			String subject = "이메일 인증을 위한 인증번호 발송";
			String content = "인증번호: " + emailKey;

			helper.setSubject(subject);
			helper.setText(content, true);
			helper.setTo(email);

			mailSender.send(message);

			System.out.println("이메일 전송 완료!");
			return "전송성공";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("이메일 전송 실패!");
			return "전송실패";
		}
	}

}
