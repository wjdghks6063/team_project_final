package com.team.pjt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.notice.NoticeDelete;
import command.notice.NoticeList;
import command.notice.NoticeUpdate;
import command.notice.NoticeView;
import command.notice.NoticeWrite;

import common.Command;
import common.CommonSummerNote;
import common.CommonUtil;

@Controller
public class NoticeController {

		//공지 삭제
			@RequestMapping("NoticeDelte")
			public String NoticeDelete(HttpServletRequest request) {
			Command noti = new NoticeDelete();
			noti.execute(request);
			return  "common_alert_page";

			}
		
		//공지 수정
		@RequestMapping("NoticeUpdate")
		public String NoticeUpdate(HttpServletRequest request) {
		Command noti = new NoticeUpdate();
		noti.execute(request);
		return  "common_alert_page";

		}
		//공지 썸머노트
		@RequestMapping("NoticeSummerNoteImgUpload")
		public void NoticeSummerNote(HttpServletRequest request, HttpServletResponse response) {
			CommonSummerNote noticeNote = new CommonSummerNote();
			noticeNote.execute("notice",request, response);
		}
		//첨부 썸머노트 때문에 따로 만든 공지 글쓰기
		@RequestMapping("NoticeSave")
			public String NoticeSave(HttpServletRequest request) {
			Command noti = new NoticeWrite();
			noti.execute(request);
			return  "common_alert_page";
		
		}
	
	//기본 공지 들
		@RequestMapping("Notice")
			public String Notice(HttpServletRequest request) {
			String gubun = request.getParameter("t_gubun");
			
			if(gubun == null) gubun = "List";
			String viewPage="";	
			if(gubun.equals("List")) {
				//공지 기본화면 리스트//
				Command noti = new NoticeList();
				noti.execute(request);
				viewPage="notice/notice_list";
				
			}else if(gubun.equals("WriteForm")) {
				//글쓰기 양식으로//
				String today = CommonUtil.getToday();
				
				viewPage="notice/notice_write";
			}else if(gubun.equals("View")) {
				//공지 뷰
				Command noti = new NoticeView();
				noti.execute(request);
				viewPage="notice/notice_view";
			}else if(gubun.equals("UpdateForm")) {
				//공지 뷰
				Command noti = new NoticeView();
				noti.execute(request);
				viewPage="notice/notice_update";
			}else if(gubun.equals("Delete")) {
				/*공지 삭제
				Command noti = new NoticeDelete();
				noti.execute(request);
				viewPage="common_alert_page";*/
			}
			
			
				
				return viewPage;
		}
	
	
}
