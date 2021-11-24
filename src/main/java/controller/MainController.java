package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.MemberServiceImpl;

@Controller
public class MainController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	//ID중복검사 ajax 함수로 처리
	@RequestMapping(value = "/member_idcheck.nhn", method = RequestMethod.POST)
	public String member_idcheck(@RequestParam("memberid") String id, Model model) throws Exception{
		System.out.println("id: " + id);
		
		int result = memberService.checkMemberId(id);
		model.addAttribute("result", result);
		
		return "member/idcheckResult";
	}
	
	//메인
	@RequestMapping(value = "/main.do")
	public String main() {
		return "member/main";
	}
}
