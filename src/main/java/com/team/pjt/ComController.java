package com.team.pjt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComController {
	
	//회사찾아오시는길
		@RequestMapping("Gil")
		public String Gil() {
			return "company/gil";
		}
	
	//회사 파트너사
		@RequestMapping("Partner")
		public String Partner() {
			return "company/partner";
		}
	
	//회사연혁
	@RequestMapping("Comhis")
	public String Comhis() {
		return "company/comhis";
	}
	
	//컴패니
	@RequestMapping("Company")
	public String Company() {
	
	return  "company/intro";

	}
}
