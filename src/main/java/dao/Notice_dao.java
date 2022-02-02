package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.DBConnection;
import dto.Dona_dto;
import dto.Notice_dto;

public class Notice_dao {

	Connection con 			= null;
	PreparedStatement ps 	= null;
	ResultSet rs 			= null;

	//기부 데이터 삭제
		public int NoticeDelete(String no){
			int result = 0;
			String query = 
					"DELETE FROM notice \r\n" + 
					"WHERE no = '"+no+"'";
			try {
				con 	= DBConnection.getConnection();
				ps 		= con.prepareStatement(query);
				result 	= ps.executeUpdate();
			}catch(SQLException e) {
				System.out.println("NoticeDelete() 메소드 실패");
				System.out.println("query : "+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}return result;
		}
		
		
		//기부 수정하기
		public int NoticeUpdate(Notice_dto dto) {
			int result = 0;
			String query = 
					"UPDATE notice\r\n" + 
					"SET \r\n" + 
					"title 							= '"+dto.getTitle()+"',\r\n" + 
					"content 						= '"+dto.getContent()+"',\r\n" + 
					"reg_date 						= '"+dto.getReg_date()+"',\r\n" + 
					"reg_id							= '"+dto.getReg_id()+"',\r\n" + 
					"attatch 						= '"+dto.getAttatch()+"',\r\n" + 
					"hit							= "+dto.getHit()+",\r\n" + 
					"important 						= "+dto.getImportant()+"\r\n" + 
					"where no 						= '"+dto.getNo()+"'";
			try {
				con 	= DBConnection.getConnection();
				ps 		= con.prepareStatement(query);
				result 	= ps.executeUpdate();
			}catch(SQLException e) {
				System.out.println("NoticeUpdate() 메소드 실패");
				System.out.println("query : "+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}return result;
		}
		
		
		//자료실 상세보기
			public Notice_dto NoticeView(String no) {
				Notice_dto dto = null;
				String query = 
				"select "+ 
				"no, title, content, "+
				"to_char(reg_date,'yyyy-MM-dd'), reg_id, attatch, hit, important " +
				"from notice " +
				"where no = '"+no+"'";
				
				try {
					con 	= DBConnection.getConnection();
					ps 		= con.prepareStatement(query);
					rs 		= ps.executeQuery();
					if(rs.next()) {
						String num 			= rs.getString(1);
						String title 		= rs.getString(2);
						String content 		= rs.getString(3);
						String reg_date 	= rs.getString(4);
						String reg_id		= rs.getString(5);
						String attatch	 	= rs.getString(6);
					
						int hit 			= rs.getInt(7);
						int important 			= rs.getInt(8);
						
						dto = new Notice_dto(no,title,content,reg_date,reg_id,attatch,hit,important);
					}
				}catch(SQLException e) {
					System.out.println("NoticeView() 메소드 실패");
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
					"update notice "+
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
		public int NoticeSave(Notice_dto dto) {
			int result = 0;
			String query =
					"INSERT INTO \r\n" + 
					"notice \r\n" + 
					"VALUES \r\n" + 
					"('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"', '"+dto.getReg_date()+"', '"+dto.getReg_id()+"','"+dto.getAttatch()+"',"+dto.getHit()+","+dto.getImportant()+")";
		
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
				
			}catch(SQLException e){
				System.out.println("NoticeSave() 메소드 오류");
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
					"select max(no) from notice ";
			
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					no = rs.getString(1);
				}
				if (no.equals("")) {
					no = "N001";
				}else {
					String n = no.substring(1);
					int num = Integer.parseInt(n);
					num += 1;
					DecimalFormat df = new DecimalFormat("N000");
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
						"from notice\r\n" + 
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
		public ArrayList<Notice_dto> NoticeList(String select,String search,int start, int end){
			ArrayList<Notice_dto> dtos = new ArrayList<Notice_dto>();
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
					"no,title,content,reg_date,reg_id,attatch,hit,important\r\n" + 
					"FROM notice\r\n" + 
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
						String title 		= rs.getString(3);
						String content 		= rs.getString(4);
						String reg_date 	= rs.getString(5);
						String reg_id 		= rs.getString(6);
						String attatch 		= rs.getString(7);
											
						int hit 			= rs.getInt(8);
						int important 		= rs.getInt(9);
						
						Notice_dto dto = new Notice_dto(no,title,content,reg_date,reg_id,attatch,hit,important);
						dtos.add(dto);
						
					}
				}catch(SQLException e) {
					System.out.println("NoticeList() 메소드 실패");
					System.out.println("query : "+ query);
					e.printStackTrace();
					
				}finally {
					DBConnection.closeDB(con, ps, rs);
				}
			return dtos;
		}
}
