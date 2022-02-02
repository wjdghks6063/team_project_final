package command.vol;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import common.CommonUtil;
import common.CommonUtil_pyw;
import dao.Vol_dao;


public class VolDelete implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Vol_dao dao = new Vol_dao();
		String no = request.getParameter("t_no");
		String attach_name = request.getParameter("t_attach");
		if(attach_name !=(null)){
			File file = new File(CommonUtil_pyw.getFile_dir_vol(),attach_name);
			file.delete();
			
		}
		
		int result = dao.VolDelete(no);
		if(result==1) {
			request.setAttribute("t_msg", "삭제성공~");
			
		}else {
			request.setAttribute("t_msg", "삭제실패~");
		
		}
			request.setAttribute("t_url", "Volunteer");
			request.setAttribute("t_result", result);
	}

}
