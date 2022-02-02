package command.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import dao.Member_dao;
import dto.Member_dto;

public class Manager_Member implements Command {
	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Member_dao mem_dao = new Member_dao();
		
		String select = request.getParameter("t_select");
		String search = request.getParameter("t_search");
		String info_yn = request.getParameter("t_info_yn");
		
		if(select==null) {
			select = "name";
		}
		if(search==null) {
			search="";
		}
		
		ArrayList<Member_dto> mem_dtos = mem_dao.Member_manager(select,search,info_yn);
		ArrayList<Member_dto> exit_mem_dtos = mem_dao.Member_manager_exit();
		
		request.setAttribute("t_dtos", mem_dtos);
		request.setAttribute("t_exit_mem_dtos", exit_mem_dtos);
		request.setAttribute("t_select", select);
		request.setAttribute("t_search", search);
		request.setAttribute("t_info_yn", info_yn);
	}

}
