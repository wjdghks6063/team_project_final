package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import dao.Qna_dao;
import dto.Qna_dto;

public class DBQnaADelete implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// 답변삭제
				Qna_dao dao = new Qna_dao();
				
				String no = request.getParameter("t_no");
				String answer = "";
				String aregname = "";
				String aregdate = "";
				
				Qna_dto dto = new Qna_dto(no,answer,aregname,aregdate);
				int result = dao.getQnaASave(dto);		
				String msg = "";
				
				if(result == 1) {
					msg = "답변 삭제 성공";
				}else msg = "답변 삭제 실패";
				
				request.setAttribute("t_msg", msg);
				request.setAttribute("t_url", "Qna");
	}

}
