package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import common.CommonUtil;
import dao.Qna_dao;
import dto.Qna_dto;

public class DBQnaQUpdate implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// 질문 수정용
				Qna_dao dao = new Qna_dao();
				String no 		= request.getParameter("t_no");
				String qtitle 	= request.getParameter("t_q_title");
				String qcontent = request.getParameter("t_q_content");
				String qregid 	= request.getParameter("t_id");
				String qregdate = CommonUtil.getTodayTime();
				String secret 	= request.getParameter("t_secret");
				
				
				Qna_dto dto = new Qna_dto(no,qtitle,qcontent,qregid,qregdate,secret);
				int result = dao.getQnaUpdate(dto);
				String msg = "";
				
				if(result == 1) {
					msg = "질문 수정 성공";
				}else msg = "질문 수정 실패";
				
				request.setAttribute("t_msg", msg);
				request.setAttribute("t_url", "Qna");

	}

}
