package command.notice;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import dao.Dona_dao;
import dao.Notice_dao;
import dto.Dona_dto;
import dto.Notice_dto;

public class NoticeView implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Notice_dao dao = new Notice_dao();
		String no = request.getParameter("t_no");
		dao.setHitCount(no);
		Notice_dto dto = dao.NoticeView(no);
		
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_no", no);
	}

}
