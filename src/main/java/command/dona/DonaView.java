package command.dona;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import common.CommonUtil;
import dao.Dona_dao;
import dao.Member_dao;
import dto.Dona_dto;
import dto.Member_dto;

public class DonaView implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Dona_dao dao = new Dona_dao();
		String no = request.getParameter("t_no");
		dao.setHitCount(no);
		Dona_dto dto = dao.DonaView(no);
		Member_dao mem_dao = new Member_dao();
		
		String id = request.getParameter("t_id");
		Member_dto mem_dto = mem_dao.getMemberView(id);
		
		String today = CommonUtil.getToday23();
		
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_no", no);
		request.setAttribute("t_mem_dto", mem_dto);
		request.setAttribute("t_today", today);
	}

}
