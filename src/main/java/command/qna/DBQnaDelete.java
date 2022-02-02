package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import dao.Qna_dao;

public class DBQnaDelete implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// 질문삭제이자 게시글 삭제
				Qna_dao dao = new Qna_dao();
				String no = request.getParameter("t_no");
				
				int result = dao.getQnaDelete(no);
				String msg = "";
				
				if(result == 1) {
					msg = "질문 삭제 성공";
				}else msg = "질문 삭제 실패";
				
				request.setAttribute("t_msg", msg);
				request.setAttribute("t_url", "Qna");
	}

}
