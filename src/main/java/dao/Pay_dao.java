package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Pay_dto;

public class Pay_dao {
	Connection 			con = null;
	PreparedStatement 	ps 	= null;
	ResultSet 			rs 	= null;
	
	public Pay_dto getPurchageList_order_id(String order_id){
		Pay_dto dto = null;
		String query="select order_id,towhat,method,method_name,method_no,receipt_id,receipt_url,dona_date,amount,cancel_yn from dona_pay_history where order_id ='"+order_id+"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String order_idd = rs.getString(1);
				String towhat = rs.getString(2);
				String method = rs.getString(3);
				String method_name = rs.getString(4);
				String method_no = rs.getString(5);
				String receipt_id = rs.getString(6);
				String receipt_url = rs.getString(7);
				String dona_date = rs.getString(8);
				int amount = rs.getInt(9);
				String cancel_yn = rs.getString(10);
				dto = new Pay_dto(order_idd,towhat,method,method_name,method_no,receipt_id,receipt_url,dona_date,amount,cancel_yn);
			}
				
		}catch(SQLException e) {
			System.out.println("getPurchageList()오류"+ query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;	
	}
	
	public ArrayList <Pay_dto> getPayList(String id, String day_1, String day_2,int end){
		ArrayList<Pay_dto> dtos = new ArrayList<Pay_dto>();
		String query="         select * from (\r\n" + 
				"    select tbl.* , rownum as rnum \r\n" + 
				"        from(\r\n" + 
				"            select * from (select order_id,towhat,method,method_name,method_no,receipt_id,receipt_url,dona_date,amount,cancel_yn from dona_pay_history where id ='"+id+"') order by dona_date desc \r\n" + 
				"            ) tbl \r\n" + 
				"            )  where dona_date between '"+day_1+" 00:00:00"+"' and '"+day_2+" 23:59:59"+"' and rnum >=1 and rnum <="+end+"";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String order_id = rs.getString(1);
				String towhat = rs.getString(2);
				String method = rs.getString(3);
				String method_name = rs.getString(4);
				String method_no = rs.getString(5);
				String receipt_id = rs.getString(6);
				String receipt_url = rs.getString(7);
				String dona_date = rs.getString(8);
				int amount = rs.getInt(9);
				String cancel_yn = rs.getString(10);
				Pay_dto dto = new Pay_dto(order_id,towhat,method,method_name,method_no,receipt_id,receipt_url,dona_date,amount,cancel_yn);
				dtos.add(dto);
			}
				
		}catch(SQLException e) {
			System.out.println("getPayList()오류"+ query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;	
	}
	
	public int getTotalcount_pay(String id, String day_1, String day_2){
		int result= 0;
		String query="select count(*) from (\r\n" + 
				"    select tbl.* , rownum as rnum \r\n" + 
				"        from(\r\n" + 
				"            select * from (select order_id,towhat,method,method_no,receipt_id,receipt_url,id,dona_date,amount,cancel_yn from dona_pay_history where id ='"+id+"') order by dona_date desc \r\n" + 
				"            ) tbl \r\n" + 
				"            )  where dona_date between '"+day_1+" 00:00:00"+"' and '"+day_2+" 23:59:59"+"'";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
			}catch(SQLException e) {
				System.out.println("getTotalcount_dona()메서드 오류");
				System.out.println("쿼리문 : " +query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return result;
	}
	
	public ArrayList <Pay_dto> getPurchageList(String id){
		ArrayList<Pay_dto> dtos = new ArrayList<Pay_dto>();
		String query="select order_id,towhat,method,method_name,method_no,receipt_id,receipt_url,dona_date,amount,cancel_yn from dona_pay_history where id ='"+id+"' order by dona_date desc";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String order_id = rs.getString(1);
				String towhat = rs.getString(2);
				String method = rs.getString(3);
				String method_name = rs.getString(4);
				String method_no = rs.getString(5);
				String receipt_id = rs.getString(6);
				String receipt_url = rs.getString(7);
				String dona_date = rs.getString(8);
				int amount = rs.getInt(9);
				String cancel_yn = rs.getString(10);
				Pay_dto dto = new Pay_dto(order_id,towhat,method,method_name,method_no,receipt_id,receipt_url,dona_date,amount,cancel_yn);
				dtos.add(dto);
			}
				
		}catch(SQLException e) {
			System.out.println("getPurchageList()오류"+ query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;	
	}
	
	public int PutDonaResult(Pay_dto dto){
		int result = 0;
		String query ="\r\n" + 
				"insert into dona_pay_history \r\n" + 
				"(order_id,towhat,method,method_name,method_no,receipt_id,receipt_url,id,dona_date,amount,cancel_yn,no)\r\n" + 
				"values\r\n" + 
				"('"+dto.getOrder_id()+"','"+dto.getItem_name()+"','"+dto.getMethod()+"','"+dto.getMethod_name()+"','"+dto.getMethod_no()+"','"+dto.getReceipt_id()+"','"+dto.getReceipt_url()+"','"+dto.getId()+"','"+dto.getPurchase_date()+"',"+dto.getAmount()+",'"+dto.getCancel_yn()+"','"+dto.getNo()+"')";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("PutDonaResult() 오류");
			System.out.println("query : "+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	public String getSearch(String no){
		String Search ="";
		String query ="select search from donation where no ='"+no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			if(rs.next()){
				Search = rs.getString(1);
			}
		}catch(SQLException e) {
			System.out.println("getSearch() 오류");
			System.out.println("query : "+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return Search;
	}
	
	public int getDonationTotal(String no){
		int Total =0;
		String query ="select total from donation where no ='"+no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			if(rs.next()){
				Total = rs.getInt(1);
			}
		}catch(SQLException e) {
			System.out.println("getDonationTotal() 오류");
			System.out.println("query : "+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return Total;
	}
	
	
	public int PutDonaHistory(Pay_dto dto,String no, String search){
		int result = 0;
		String query ="\r\n" + 
				"insert into mypage_dona_history \r\n" + 
				"(id,no,dona_date,amount,title,search,order_id)\r\n" + 
				"values\r\n" + 
				"('"+dto.getId()+"','"+no+"','"+dto.getPurchase_date()+"','"+dto.getAmount()+"','"+dto.getItem_name()+"','"+search+"','"+dto.getOrder_id()+"')";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("PutDonaResult() 오류");
			System.out.println("query : "+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	public int DonaTotalUpdate(String no,int total, int amount){
		int result = 0;
		String query ="update donation set total = "+total+"+"+amount+" where no ='"+no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}catch(SQLException e) {
			System.out.println("PutDonaResult() 오류");
			System.out.println("query : "+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
}
