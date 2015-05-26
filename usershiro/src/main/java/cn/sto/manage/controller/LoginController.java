package cn.sto.manage.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.sto.manage.pojo.User;
import cn.sto.manage.service.UserService;
import cn.sto.manage.utils.UsernamePasswordCaptchaToken;

@Controller
@RequestMapping(value = "/user")
public class LoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login")
	public String login(User user,@RequestParam("captcha")String captcha){
		
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordCaptchaToken token = new UsernamePasswordCaptchaToken(user.getLoginName(), user.getPassword(), captcha);
		subject.login(token);
		return "index";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(Model model){
		
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}
}
