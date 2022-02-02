package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import common.CommonUtil;
import dao.Qna_dao;
import dto.Qna_dto;

public class DBQnaASave implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// 답변 저장과 답변 수정을 동시에!
				Qna_dao dao = new Qna_dao();
				
				String no = request.getParameter("t_no");
				String answer = request.getParameter("t_answer");
				String aregname = request.getParameter("t_a_name");
				String aregdate = CommonUtil.getTodayTime();
				
				Qna_dto dto = new Qna_dto(no,answer,aregname,aregdate);
				int result = dao.getQnaASave(dto);		
				String msg = "";
				
				if(result == 1) {
					msg = "답변 등록 성공";
				}else msg = "답변 등록 실패";
				
				request.setAttribute("t_msg", msg);
				request.setAttribute("t_url", "Qna");
	}

}
