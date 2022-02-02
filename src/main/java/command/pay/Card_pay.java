package command.pay;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import dao.Dona_dao;
import dao.Mypage_dao;
import dao.Pay_dao;
import dto.Mypage_dto;
import dto.Pay_dto;

public class Card_pay implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub

		String order_id = request.getParameter("t_order_id");
		String method = request.getParameter("t_method");
		String card_name = request.getParameter("t_card_name");
		String card_no = request.getParameter("t_card_no");
		String dona_date = request.getParameter("t_dona_date");
		String receipt_id = request.getParameter("t_receipt_id");
		String receipt_url = request.getParameter("t_receipt_url");
		String item_name = request.getParameter("t_item_name");
		String id = request.getParameter("t_id");
		int amount = Integer.parseInt(request.getParameter("t_amount"));
		String no = request.getParameter("t_no");
		String cancel_yn = "n";
		Pay_dto pay_dto = new Pay_dto(order_id,method,card_name,card_no,dona_date,receipt_id,receipt_url,item_name,id,amount,cancel_yn,no);
		Pay_dao pay_dao = new Pay_dao();
		
		
		PrintWriter out =null;
		
		int result = pay_dao.PutDonaResult(pay_dto);
		
		String search = pay_dao.getSearch(no);
		int result2 = pay_dao.PutDonaHistory(pay_dto,no,search);
		
		int donation_total = pay_dao.getDonationTotal(no);
		int result3 = pay_dao.DonaTotalUpdate(no,donation_total,amount);
		
		//System.out.println(result2);
		//System.out.println(result3);
}
}
