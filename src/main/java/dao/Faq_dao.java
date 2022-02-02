package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.DBConnection;
import dto.Faq_dto;
import dto.Notice_dto;

public class Faq_dao {
	Connection con 			= null;
	PreparedStatement ps 	= null;
	ResultSet rs 			= null;

	//기부 데이터 삭제
		public int FaqDelete(String no){
			int result = 0;
			String query = 
					"DELETE FROM faq \r\n" + 
					"WHERE no = '"+no+"'";
			try {
				con 	= DBConnection.getConnection();
				ps 		= con.prepareStatement(query);
				result 	= ps.executeUpdate();
			}catch(SQLException e) {
				System.out.println("FaqDelete() 메소드 실패");
				System.out.println("query : "+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}return result;
		}
		
		
		//기부 수정하기
		public int FaqUpdate(Faq_dto dto) {
			int result = 0;
			String query = 
					"UPDATE faq\r\n" + 
					"SET \r\n" + 
					"title 							= '"+dto.getTitle()+"',\r\n" + 
					"content 						= '"+dto.getContent()+"',\r\n" + 
					
					"Important 						= "+dto.getImportant()+"\r\n" + 
					"where no 						= '"+dto.getNo()+"'";
			try {
				con 	= DBConnection.getConnection();
				ps 		= con.prepareStatement(query);
				result 	= ps.executeUpdate();
			}catch(SQLException e) {
				System.out.println("FaqUpdate() 메소드 실패");
				System.out.println("query : "+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}return result;
		}
		
		
		//자료실 상세보기
			public Faq_dto FaqView(String no) {
				Faq_dto dto = null;
				String query = 
				"select "+ 
				"no, important, title, content "+
			
				"from faq " +
				"where no = '"+no+"'";
				
				try {
					con 	= DBConnection.getConnection();
					ps 		= con.prepareStatement(query);
					rs 		= ps.executeQuery();
					if(rs.next()) {
						String num 			= rs.getString(1);
						String important 	= rs.getString(2);
						String title 		= rs.getString(3);
						String content 		= rs.getString(4);
						
						
						
						dto = new Faq_dto(num,important,title,content);
					}
				}catch(SQLException e) {
					System.out.println("FaqView() 메소드 실패");
					System.out.println("query : "+query);
					e.printStackTrace();
				}finally {
					DBConnection.closeDB(con, ps, rs);
				}return dto;
			}
			
	//조회수	
		public void setHitCount(String no) {
			int result = 0;
			String query =
					"update faq "+
					"set hit = hit + 1 "+
					"where no = '"+no+"'";
			
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(SQLException e) {
				System.out.println("setHitCount() 메소드 오류");
				System.out.println("query"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}	
		}
		
		// 공지 저장 메소드//	
		public int FaqSave(Faq_dto dto) {
			int result = 0;
			String query =
					"INSERT INTO \r\n" + 
					"faq \r\n" + 
					"VALUES \r\n" + 
					"('"+dto.getNo()+"','"+dto.getImportant()+"','"+dto.getTitle()+"','"+dto.getContent()+"')";
		
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
				
			}catch(SQLException e){
				System.out.println("FaqSave() 메소드 오류");
				System.out.println("query : "+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
				
			}
			return result;
		}
		//게시글 번호 생성
		public String getMaxNo() {
			String no = "";
			String query =
					"select max(no) from faq ";
			
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					no = rs.getString(1);
				}
				if (no.equals("")) {
					no = "F001";
				}else {
					String n = no.substring(1);
					int num = Integer.parseInt(n);
					num += 1;
					DecimalFormat df = new DecimalFormat("F000");
					no = df.format(num);
					
				}
			}catch(SQLException e){
				System.out.println("notice getMaxNo() 메소드 오류");
				System.out.println("query"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
				
			}
			
			return no;
		}		
		//조회 카운트
			public int getTotalCount(String select,String search) {
				int count = 0;
				String query =
						"select count(*) \r\n" + 
						"from faq\r\n" + 
						"where "+select+" like '%"+search+"%' \r\n" ; 
						
			
				try {
					con = DBConnection.getConnection();
					ps = con.prepareStatement(query);
					rs = ps.executeQuery();
					if(rs.next()) {
						count = rs.getInt(1);
					}
				}catch(SQLException e){
					System.out.println("getTotalCount() 메소드 오류");
					System.out.println("query : "+query);
					e.printStackTrace();
				}finally {
					DBConnection.closeDB(con, ps, rs);
					
				}
				return count;
			}	
	
	//리스트 전체 조회 + 검색기능 + 페이징
		public ArrayList<Faq_dto> FaqList(String select,String search,int start, int end){
			ArrayList<Faq_dto> dtos = new ArrayList<Faq_dto>();
					/*String query = 
					"SELECT\r\n" + 
					"no,title,content,reg_date,reg_id,attatch,hit,important\r\n" + 
					"FROM notice\r\n" + 
					"where title like '%%'\r\n" + 
					"order by no desc"; */
			String query = 
					"SELECT  * FROM\r\n" + 
					"(\r\n" + 
					"select rownum as rnum, a.* from\r\n" + 
					"(\r\n" + 		
					"SELECT\r\n" + 
					"no,important,title,content\r\n" + 
					"FROM faq\r\n" + 
					"where "+select+" like '%"+search+"%'\r\n" + 
					"order by no desc"+
					") a \r\n" + 
					")\r\n" + 
					"where rnum >="+start+" and rnum<= "+end+"";
			
				try {
					con 	= DBConnection.getConnection();
					ps 		= con.prepareStatement(query);
					rs 		= ps.executeQuery();
					while(rs.next()) {
						String no 			= rs.getString(2);
						String important 	= rs.getString(3);
						String title 		= rs.getString(4);
						String content 		= rs.getString(5);
						
					
						
						Faq_dto dto = new Faq_dto(no,important,title,content);
						dtos.add(dto);
						
					}
				}catch(SQLException e) {
					System.out.println("FaqList() 메소드 실패");
					System.out.println("query : "+ query);
					e.printStackTrace();
					
				}finally {
					DBConnection.closeDB(con, ps, rs);
				}
			return dtos;
		}
}
