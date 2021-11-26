package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import model.MemberBean;
import service.MemberServiceImpl;

@Controller
public class MainController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	//ID 중복검사
	@RequestMapping(value = "/member_idcheck.nhn", method = RequestMethod.POST)
	public String member_idcheck(@RequestParam("memid") String id, Model model) throws Exception{
		System.out.println("id: " + id);
		
		int result = memberService.checkMemberId(id);
		model.addAttribute("result", result);
		
		return "/member/idcheckResult";
	}

	
	
	//메인
	@RequestMapping(value = "/main.nhn")
	public String main() {
		
		return "/member/main";
	}
	
	//회원가입 폼
	@RequestMapping(value = "/member_join.nhn")
	public String member_join() {
		
		return "/member/member_join";
	}
	
	//회원가입
	@RequestMapping(value = "/member_join_ok.nhn", method = RequestMethod.POST)
	public String member_join_ok(MemberBean member, HttpServletRequest request) throws Exception {
		System.out.println("회원가입");
		String mem_phone1 = request.getParameter("mem_phone1").trim();
		String mem_phone2 = request.getParameter("mem_phone2").trim();
		String mem_phone3 = request.getParameter("mem_phone3").trim();
		String mem_phone = mem_phone1+"-"+mem_phone2+"-"+mem_phone3;
		String mem_email1 = request.getParameter("mem_emil1").trim();
		String mem_email2 = request.getParameter("mem_emil2").trim();
		String mem_email = mem_email1+"@"+mem_email2;
		
		member.setMem_phone(mem_phone);
		member.setMem_email(mem_email);
		
		memberService.insertMember(member);
		
		return "redirect:member_login.nhn";
	}
}
