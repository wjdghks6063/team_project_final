package com.team.pjt;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.faq.FAQDelete;
import command.faq.FAQList;
import command.faq.FAQUpdate;
import command.faq.FAQView;
import command.faq.FAQwrite;
import common.Command;
import common.CommonUtil;

@Controller
public class FaqController {
	//faq 기부 들
			@RequestMapping("FAQ")
				public String FAQ(HttpServletRequest request) {
				String gubun = request.getParameter("t_gubun");
				
				if(gubun == null) gubun = "List";
				String viewPage="";	
				if(gubun.equals("List")) {
					//faq 기본화면 리스트//
					Command faq = new FAQList();
					faq.execute(request);
					viewPage="faq/faq_list";
					
				}else if(gubun.equals("WriteForm")) {
					//글쓰기 양식으로//
					String today = CommonUtil.getToday();
					
					viewPage="faq/faq_write";
				}else if(gubun.equals("Write")) {
					//faq 글쓰기
					Command faq = new FAQwrite();
					faq.execute(request);
					viewPage="common_alert_page";
				}else if(gubun.equals("UpdateForm")) {
					//faq 뷰
					Command faq = new FAQView();
					faq.execute(request);
					viewPage="faq/faq_update";
				}else if(gubun.equals("Update")) {
					//faq 수정//
					Command faq = new FAQUpdate();
					faq.execute(request);
					viewPage="common_alert_page";
				}else if(gubun.equals("Delete")) {
					//faq 삭제//
					Command faq = new FAQDelete();
					faq.execute(request);
					viewPage="common_alert_page";
				}
				
				
					
					return viewPage;
		
			}
}
