package command.faq;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import dao.Faq_dao;

public class FAQDelete implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Faq_dao dao = new Faq_dao();
		String no = request.getParameter("t_no");
		
		int result = dao.FaqDelete(no);
		if(result==1) {
			request.setAttribute("t_msg", "삭제성공~");
			
		}else {
			request.setAttribute("t_msg", "삭제실패~");
		
		}
			request.setAttribute("t_url", "FAQ");
			request.setAttribute("t_result", result);
		
	}

}
