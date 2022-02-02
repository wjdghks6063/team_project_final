package com.team.pjt;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.pay.Card_pay;
import common.Command;

@Controller
public class PayController {
		@RequestMapping("/Paytest")
		public String Mypage_home(HttpServletRequest request) {
			return "pay/pay_test";
	}
		@RequestMapping("/Card_Confirm")
		public String Confirm(HttpServletRequest request) {
			Command card_pay = new Card_pay();
			card_pay.execute(request);
			return "dona/dona_view";
	}

}
