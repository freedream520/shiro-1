package cn.sto.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping()
@Controller
public class PageController {

	@RequestMapping(value = "{pageName}")
	public String pageController(@PathVariable("pageName")String pageName){
		
		return pageName;
	}
}
