package command.notice;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Command;
import common.CommonUtil;
import dao.Notice_dao;
import dto.Notice_dto;

public class NoticeWrite1 implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Notice_dao dao = new Notice_dao();
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int sizeLimit = 1024 * 1024 * 10;
		//String file_dir = CommonUtil.getFile_dir_dona();
		//"C:/Users/jsl505/Desktop/park_work/spring_team_pjt/src/main/webapp/webContent/file_room/dona/";
		 HttpSession session = request.getSession();
	      ServletContext context = session.getServletContext();
	      String file_dir = context.getRealPath("/webContent/file_room/notice/");
	      
	      DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
		MultipartRequest mpr=null;
		try { 
			mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8",df);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String no 			= dao.getMaxNo();
		String title 		= mpr.getParameter("t_title");
		String content 		= mpr.getParameter("t_content");
		String reg_date		= CommonUtil.getTodayTime();
		String reg_id 		= mpr.getParameter("t_reg_id");
		
		String attatch 		= mpr.getFilesystemName("t_attatch");
		if(attatch == null) attatch = "";
		
		int hit 			= 0;
		String ggoal 		= mpr.getParameter("t_important");
		int important 			= Integer.parseInt(ggoal);
		System.out.println(no+"    "+content+"  "+reg_date+"  "+attatch+"  "+attatch+"   "+content);
		
		Notice_dto dto = new Notice_dto(no,title,content,reg_date,reg_id,attatch,hit,important);
		int result = dao.NoticeSave(dto);
		
		if(result==1) {
			request.setAttribute("t_msg", "등록 성공~");
			
		}else {
			request.setAttribute("t_msg", "등록 실패~");
		
		}
			request.setAttribute("t_url", "Notice");
			request.setAttribute("t_result", result);

	}

}
