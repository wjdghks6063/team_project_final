package command.faq;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import common.CommonUtil;
import dao.Faq_dao;
import dao.Notice_dao;
import dto.Faq_dto;
import dto.Notice_dto;

public class FAQwrite implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Faq_dao dao = new Faq_dao();
		
		String no 			= dao.getMaxNo();
		String title 		= request.getParameter("t_title");
		String content 		= request.getParameter("t_content");
		
		String important 	= request.getParameter("t_important"); 
		
		Faq_dto dto = new Faq_dto(no,important,title,content);
		int result = dao.FaqSave(dto);
		
		if(result==1) {
			request.setAttribute("t_msg", "등록 성공~");
			
		}else {
			request.setAttribute("t_msg", "등록 실패~");
		
		}
			request.setAttribute("t_url", "FAQ");
			request.setAttribute("t_result", result);
	}
	

}
