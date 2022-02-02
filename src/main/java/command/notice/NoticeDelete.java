package command.notice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import common.CommonUtil;
import common.CommonUtil_pyw;
import dao.Dona_dao;
import dao.Notice_dao;

public class NoticeDelete implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Notice_dao dao = new Notice_dao();
		String no = request.getParameter("t_no");
		String attatch_name = request.getParameter("t_attatch");
		if(attatch_name !=(null)){
			File file = new File(CommonUtil_pyw.getFile_dir_notice(),attatch_name);
			file.delete();
			
		}
		
		int result = dao.NoticeDelete(no);
		if(result==1) {
			request.setAttribute("t_msg", "삭제성공~");
			
		}else {
			request.setAttribute("t_msg", "삭제실패~");
		
		}
			request.setAttribute("t_url", "Notice");
			request.setAttribute("t_result", result);
	}

}
