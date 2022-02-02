package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import common.CommonUtil;
import dao.Qna_dao;
import dto.Qna_dto;

public class DBQnaSave implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Qna_dao dao = new Qna_dao();
		String no 		= dao.getMaxNo();
		String qtitle 	= request.getParameter("t_q_title");
		String qcontent = request.getParameter("t_q_content");
		String qregid 	= request.getParameter("t_id");
		String qregdate = CommonUtil.getTodayTime();
		String secret 	= request.getParameter("t_secret");
		
		int hit 		= 0;
		
		Qna_dto dto = new Qna_dto(no,qtitle,qcontent,qregid,qregdate,secret,hit);
		int result = dao.getQnaSave(dto);
		String msg = "";
		
		if(result == 1) {
			msg = "질문 등록 성공";
		}else msg = "질문 등록 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Qna");
	}

}
