package command.faq;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import dao.Faq_dao;
import dao.Notice_dao;
import dto.Faq_dto;
import dto.Notice_dto;

public class FAQView implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Faq_dao dao = new Faq_dao();
		String no = request.getParameter("t_no");
		
		Faq_dto dto = dao.FaqView(no);
		
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_no", no);
	}

}
