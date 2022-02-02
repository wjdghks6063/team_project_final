package com.team.pjt;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.faq.FAQDelete;
import command.faq.FAQList;
import command.faq.FAQUpdate;
import command.faq.FAQView;
import command.faq.FAQwrite;
import command.qna.DBQnaADelete;
import command.qna.DBQnaASave;
import command.qna.DBQnaDelete;
import command.qna.DBQnaQUpdate;
import command.qna.DBQnaSave;
import command.qna.QnaList;
import command.qna.QnaView;
import common.Command;
import common.CommonUtil;

@Controller
public class QnaController {
	//Qna 기본 틀
		@RequestMapping("Qna")
		public String FAQ(HttpServletRequest request) {
		String gubun = request.getParameter("t_gubun");
		
		if(gubun == null) gubun = "List";
		String viewPage="";	
		if(gubun.equals("List")) {
			//faq 기본화면 리스트//
			Command qna = new QnaList();
			qna.execute(request);
			viewPage="qna/qna_list";
			
		}else if(gubun.equals("WriteForm")) {
			//글쓰기 양식으로//
			
			
			viewPage="qna/qna_write";
		}else if(gubun.equals("Write")) {
			//qna 글쓰기 등록
			Command qna = new DBQnaSave();
			qna.execute(request);
			viewPage="common_alert_page";
		}else if(gubun.equals("View")) {
			//qna 뷰
			Command qna = new QnaView();
			qna.execute(request);
			viewPage="qna/qna_view";
		}else if(gubun.equals("AnswerSave")) {
			//답변 등록, 수정 
			Command qna = new DBQnaASave();
			qna.execute(request);
			viewPage="common_alert_page";
		}else if(gubun.equals("AnswerDelete")) {
			//답변 삭제 
			Command qna = new DBQnaADelete();
			qna.execute(request);
			viewPage="common_alert_page";
		}else if(gubun.equals("UpdateForm")) {
			//질문 수정폼
			Command qna = new QnaView();
			qna.execute(request);
			viewPage = "qna/qna_update";
		}else if(gubun.equals("Update")) {
			//질문 수정
			Command qna = new DBQnaQUpdate();
			qna.execute(request);
			viewPage = "common_alert_page";
		}else if(gubun.equals("Delete")) {
			//질문삭제
			Command qna = new DBQnaDelete();
			qna.execute(request);
			viewPage = "common_alert_page";
		}
				
			return viewPage;
		}
}