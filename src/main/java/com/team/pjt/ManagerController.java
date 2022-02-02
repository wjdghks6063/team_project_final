package com.team.pjt;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import command.manager.Manager_Member;
import command.manager.Manager_donation;
import command.manager.Manager_donation_search;
import command.manager.Manager_home;
import command.manager.Manager_volunteer;
import command.manager.Manager_volunteer_search;
import common.Command;
import dao.Manager_dao;
import dto.Manager_dto;

@Controller
public class ManagerController {
	 
	//root-context.xml에 추가한 부분
	@Autowired
	  private JavaMailSender mailSender;
	 
	  @RequestMapping("MailSending")
	  public String mailSending( HttpServletRequest request) {
	   
	    String setfrom = "IseeU";         
	    String title   = request.getParameter("t_title");      // 제목
	    String content = request.getParameter("t_content");    // 내용
	    String attach = request.getParameter("t_attach");    // 내용
	    String[] arrayParam = request.getParameterValues("t_to_email[]");
	    
	    String msg="";
	    int result=0;
	    String url="";
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	      
	    	  messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	  	      messageHelper.setTo(arrayParam);     // 받는사람 이메일
	  	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	  	      messageHelper.setText(content);  // 메일 내용
	  
	     
	      //파일첨부
	      // 파일첨부
	     // FileSystemResource fsr = new FileSystemResource(attach);
	     // messageHelper.addAttachment("test2.txt", fsr);
	     
	      mailSender.send(message);
	      
	      result=1;
	      url="Member_manage";
	      msg="메일 발송에 성공했습니다";
	    } catch(Exception e){
	      System.out.println(e);
	    
	      result=0;
	      url="Member_manage";
	      msg="메일 발송에 실패했습니다";
	    }
	
	    request.setAttribute("t_result", result);
	    request.setAttribute("t_msg", msg);
	    request.setAttribute("t_url", url);
	    return "common_alert_page";
	  }
	@RequestMapping("Member_email")
	public String Member_email(HttpServletRequest request) {
		String[] arrayParam = request.getParameterValues("t_email[]");
		
		ArrayList<String> arrayParam2 = new ArrayList<String>();
		
		for(int k=0;k<arrayParam.length;k++){
			if(!arrayParam[k].equals("")) {
				arrayParam2.add(arrayParam[k]);
			}
		}
		request.setAttribute("t_arrayParam", arrayParam2);
		request.setAttribute("t_array_size", arrayParam2.size());
		return "manager/manager_email_send";
	}
	@RequestMapping("Member_manage")
		public String Member(HttpServletRequest request) {
		Command manager = new Manager_Member();
		manager.execute(request);
		return "manager/manager_member";
	}
/*----더 보기 버튼 예제 테스트  manager_donation_search_more_test.jsp 에서 작동 가능-------------*/	
	
	
	//평소 사용하듯이 dtos.getTotal(); 이런식으로 사용하려면 특별한 기능을 부여해야한다. 
	// @RequestMapping produces="application/text;charset=UTF-8 과 @ResponseBody를 써준다.
	@RequestMapping(value="ManagerListMore",produces="application/text;charset=UTF-8")
	@ResponseBody // ResponseBody를 사용하려면 dto에 getter 말고 setter도 있어야 사용 가능하다.
		public String managerListMore(HttpServletRequest request) {
			Manager_dao dao = new Manager_dao();
			String select = request.getParameter("t_select");
			String search = request.getParameter("t_search");
			if(select == null){
				select = "";
				search = "";
			}
			
			int start = Integer.parseInt(request.getParameter("t_start"));
			int end = Integer.parseInt(request.getParameter("t_end"));
			
			ArrayList<Manager_dto> dtos = dao.getDonaAllSearch(select,search);
			
			/*arraylist를 json으로 사용하려면 objectMapper로 변환시킨다*/
			ObjectMapper mapper = new ObjectMapper();
			String jsonData ="";
			
			try {
				jsonData = mapper.writeValueAsString(dtos); //writeValueAsString 를 사용하면 string type으로 array list가 들어가진다.
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return jsonData;
	}
/*---------------------------------------------------------------------------------------*/
	@RequestMapping("Manager")
	public String Manager(HttpServletRequest request) {
		String gubun = request.getParameter("t_gubun");

		if (gubun == null)
			gubun = "Home";
		String viewPage = "";
		if (gubun.equals("Home")) {
			// 매니저 기본화면 리스트//
			Command manager = new Manager_home();
			manager.execute(request);
			viewPage = "manager/manager_home";

		}else if(gubun.equals("Dona")) {
			//기부 뷰
			Command manager = new Manager_donation();
			manager.execute(request);
			viewPage="manager/manager_donation";
			
		}else if(gubun.equals("Dona_Search")) {
			//기부 검색
			Command manager = new Manager_donation_search();
			manager.execute(request);
			viewPage="manager/manager_donation_search";
			
		}else if(gubun.equals("Vol")) {
			//기부 뷰
			Command manager = new Manager_volunteer();
			manager.execute(request);
			viewPage="manager/manager_volunteer";
			
		}else if(gubun.equals("Vol_Search")) {
			//기부 검색
			Command manager = new Manager_volunteer_search();
			manager.execute(request);
			viewPage="manager/manager_volunteer_search";
			
		}
		
		return viewPage;
	}

}