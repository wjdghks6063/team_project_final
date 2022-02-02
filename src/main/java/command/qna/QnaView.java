package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import dao.Qna_dao;
import dto.Qna_dto;

public class QnaView implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Qna_dao dao 	= new Qna_dao();
		String no 		= request.getParameter("t_no");
		dao.setHitCount(no);
		Qna_dto dto 	= dao.getQnaView(no);
	
		request.setAttribute("t_dto", dto);
	}

}
