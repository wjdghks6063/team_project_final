package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.CommonUtil;
import common.DBConnection;
import dto.Qna_dto;

public class Qna_dao {
	Connection con 			= null;
	PreparedStatement ps 	= null;
	ResultSet rs 			= null;
	
	//답변이 달리지 않은 글 조회
	
	public String NotAnswer() {
		String nanswer = "0";
		String query = 
				"SELECT\r\n" + 
				"	count(*)\r\n" + 
				"	FROM qna\r\n" + 
				"	where a_content is null";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
			
				nanswer 	= rs.getString(1);
			 if(nanswer == null) nanswer = "0";
			}
			
		}catch(SQLException e) {
			System.out.println("QnaYesday() 메소드 실패");
			System.out.println("query : "+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return nanswer;
	}
	
	//신규게시글 수 (어제날짜)
			public String QnaYesday() {
				String today = "0";
				String query = 
						"SELECT\r\n" + 
						"COUNT(*)\r\n" + 
						"FROM qna\r\n" + 
						"WHERE TO_CHAR(reg_date,'YYYY-MM-DD') = TO_CHAR(SYSDATE-1,'YYYY-MM-DD')";
				try {
					con = DBConnection.getConnection();
					ps = con.prepareStatement(query);
					rs = ps.executeQuery();
					if(rs.next()) {
					
						today 	= rs.getString(1);
					 if(today == null) today = "";
					}
					
				}catch(SQLException e) {
					System.out.println("QnaYesday() 메소드 실패");
					System.out.println("query : "+query);
					e.printStackTrace();
				}finally {
					DBConnection.closeDB(con, ps, rs);
				}
				return today;
			}
		
		//신규게시글 수 (오늘날짜)
		public String QnaToday() {
			String today = "0";
			String query = 
					"SELECT\r\n" + 
					"COUNT(*)\r\n" + 
					"FROM qna\r\n" + 
					"WHERE TO_CHAR(reg_date,'YYYY-MM-DD') = TO_CHAR(SYSDATE,'YYYY-MM-DD')";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if(rs.next()) {
				
					today 	= rs.getString(1);
				 if(today == null) today = "";
				}
				
			}catch(SQLException e) {
				System.out.println("QnaToday() 메소드 실패");
				System.out.println("query : "+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return today;
		}
	
	
	//상세보기 다음페이지 용 넘버
	public String nextNumber(String no) {
		String nextno = "";
		String query = 
				"SELECT\r\n" + 
				"min(no)\r\n" + 
				"FROM qna\r\n" + 
				"where no > '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
			
			 nextno 	= rs.getString(1);
			 if(nextno == null) nextno = "";
			}
			System.out.println(nextno+"**");
		}catch(SQLException e) {
			System.out.println("nextNumber() 메소드 실패");
			System.out.println("query : "+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return nextno;
	}
	//상세보기 이전페이지 용 넘버
	public String prevNumber(String no) {
		String prevno = "";
		String query = 
				"SELECT\r\n" + 
				"max(no)\r\n" + 
				"FROM qna\r\n" + 
				"where no < '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				
				prevno 	= rs.getString(1);
				if(prevno == null) prevno = "";
			}
			//System.out.println(prevno+"**");
		}catch(SQLException e) {
			System.out.println("prevNumber() 메소드 실패");
			System.out.println("query : "+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return prevno;
	}
	
	
	//qna 질문 수정
	public int getQnaUpdate(Qna_dto dto){
		int result = 0;
		String query = 
				"UPDATE qna \r\n" + 
				"SET \r\n" + 
				"q_title = '"+dto.getQ_title()+"',\r\n" + 
				"q_content = '"+dto.getQ_content()+"',\r\n" + 
				"q_reg_id = '"+dto.getQ_reg_id()+"',\r\n" + 
				"q_reg_date = '"+dto.getQ_reg_date()+"',\r\n" + 
				"secret = '"+dto.getSecret()+"'\r\n" + 
				"where\r\n" + 
				"no = '"+dto.getNo()+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("getQnaUpdate() 메소드 오류");
			System.out.println("query"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	//qna 게시글 삭제
	public int getQnaDelete(String no) {
		int result = 0;
		String query = 
				"DELETE FROM qna \r\n" + 
				"WHERE no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("getQnaDelete() 메소드 오류");
			System.out.println("query"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
		
	}
	
	//상세보기 - 답변 저장 및 답변 수정용
	public int getQnaASave(Qna_dto dto) {
		int result = 0;
		String query = 
				"UPDATE \r\n" + 
				"qna \r\n" + 
				"SET \r\n" + 
				"a_content = '"+dto.getA_content()+"',\r\n" + 
				"a_reg_id = '"+dto.getA_reg_id()+"',\r\n" + 
				"a_reg_date = '"+dto.getA_reg_date()+"'\r\n" + 
				"where no = '"+dto.getNo()+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("QnaASave() 메소드 오류");
			System.out.println("query"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	//상세보기용
	public Qna_dto getQnaView(String noo) {
		Qna_dto dto = null;
		String query =
				"SELECT\r\n" + 
				"no,q_title,q_content,q_reg_id,\r\n" + 
				"to_char(q_reg_date,'yy-MM-DD HH.MI.SS'),hit,secret,a_content,\r\n" + 
				"to_char(a_reg_date,'yy-MM-DD HH.MI.SS')\r\n" + 
				"FROM qna\r\n" + 
				"where no = '"+noo+"'";
		
				
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				String no 			= rs.getString(1);
				String q_title 		= rs.getString(2);
				String q_content 	= rs.getString(3);
				String q_reg_id		= rs.getString(4);
			
				String q_reg_date 	= rs.getString(5);
				int hit 			= rs.getInt(6);
				String secret		= rs.getString(7);
				String a_content	= rs.getString(8);
				String a_reg_date	= rs.getString(9);
			
				
				CommonUtil.checkNull(a_content);
				dto = new Qna_dto(no,q_title,q_content,q_reg_id,q_reg_date,hit,secret,a_content,a_reg_date);
				
			}
		}catch(SQLException e) {
			System.out.println("getQnaView 메소드 오류");
			System.out.println("query : "+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
	
		return dto;
	}
	
	//글쓰기 저장용
	public int getQnaSave(Qna_dto dto) {
		int result = 0;
		String query = 
				"INSERT INTO \r\n" + 
				"qna \r\n" + 
				"VALUES \r\n" + 
				"('"+dto.getNo()+"','"+dto.getQ_title()+"','"+dto.getQ_content()+"',"
					+ "'"+dto.getQ_reg_id()+"','"+dto.getQ_reg_date()+"','','','',0,'"+dto.getSecret()+"')";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("getQnaSave() 메소드 오류");
			System.out.println("query"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}return result;	
	}
	
	
	
	//조회수	
			public void setHitCount(String no) {
				int result = 0;
				String query =
						"update qna "+
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
	
	//게시글 번호 생성
	public String getMaxNo() {
		String no = "";
		String query =
				"select max(no) from qna ";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				no = rs.getString(1);
			}
			if (no.equals("")) {
				no = "Q001";
			}else {
				String n = no.substring(1);
				int num = Integer.parseInt(n);
				num += 1;
				DecimalFormat df = new DecimalFormat("Q000");
				no = df.format(num);
				
			}
		}catch(SQLException e){
			System.out.println("qna getMaxNo() 메소드 오류");
			System.out.println("query"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
			
		}
		
		return no;
	}	
	
	//카운팅 조회 카운트
	public int getTotalCount(String select,String search) {
		int count = 0;
		String query =
				"select count(*) \r\n" + 
				"from qna\r\n" + 
				"where "+select+" like '%"+search+"%'";
	
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
	
	//qna 전체 리스트
	public ArrayList<Qna_dto> getQnaList(String select,String search,int start,int end){
		ArrayList<Qna_dto> dtos = new ArrayList<Qna_dto>();
		/*String query = 
				"SELECT\r\n" + 
				"a.no,a.q_title,a.a_content,b.name,\r\n" + 
				"to_char(a.q_regdate,'yyyy-MM-dd MI.SS'),\r\n" + 
				"a.hit\r\n" + 
				"FROM h04_ser_qna a, h04_ser_member b\r\n" + 
				"where a.q_regid = b.id\r\n" + 
				"order by a.no desc";*/
		
		String query = 
				"SELECT  * FROM\r\n" + 
				"(\r\n" + 
				"select rownum as rnum, a.* from\r\n" + 
				"(\r\n" + 
				"SELECT\r\n" + 
				"no,q_title,a_content,\r\n" + 
				"to_char(q_reg_date,'yyyy-MM-dd HH.MI.SS'),\r\n" + 
				"hit,secret,q_reg_id\r\n" + 
				"FROM qna \r\n" + 
				"where "+select+" like '%"+search+"%'\r\n" + 
				"order by no desc\r\n" + 
				") a \r\n" + 
				")\r\n" + 
				"where rnum >="+start+" and rnum<= "+end+"";
		
		
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no 			= rs.getString(2);
				String q_title 		= rs.getString(3);
				String a_content 	= rs.getString(4);
				
				String q_reg_date 	= rs.getString(5);
				int hit 			= rs.getInt(6);
				String secret		= rs.getString(7);
				String q_reg_id		= rs.getString(8);
				CommonUtil.checkNull(a_content);
				Qna_dto dto = new Qna_dto(no,q_title,a_content,q_reg_date,hit,secret,q_reg_id);
				dtos.add(dto);
			}
		}catch(SQLException e) {
			System.out.println("getQnaList() 메소드 오류");
			System.out.println("query : "+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
	}
	//qna 전체 리스트
		public ArrayList<Qna_dto> getQnaList(){
			ArrayList<Qna_dto> dtos = new ArrayList<Qna_dto>();
			String query = 
					"SELECT\r\n" + 
					"no,q_title,a_content,\r\n" + 
					"to_char(q_reg_date,'yyyy-MM-dd MI.SS'),\r\n" + 
					"hit,secret,q_reg_id\r\n" + 
					"FROM qna\r\n" + 
					"where order by no desc";
					
			
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String no 			= rs.getString(1);
					String q_title 		= rs.getString(2);
					String a_content 	= rs.getString(3);
					
					String q_reg_date 	= rs.getString(4);
					int hit 			= rs.getInt(5);
					String secret		= rs.getString(6);
					String q_reg_id		= rs.getString(7);
					CommonUtil.checkNull(a_content);
					Qna_dto dto = new Qna_dto(no,q_title,a_content,q_reg_date,hit,secret,q_reg_id);
					dtos.add(dto);
				}
			}catch(SQLException e) {
				System.out.println("getQnaList() 메소드 오류");
				System.out.println("query : "+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return dtos;
		}
}
