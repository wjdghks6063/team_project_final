package dto;

public class Qna_dto {

	private String no, q_title, q_content, q_reg_id, q_reg_date, a_content, a_reg_id, a_reg_date, secret;
	private int hit;
	
	//질문수정용
		public Qna_dto(String no, String q_title, String q_content, String q_reg_id, String q_reg_date, String secret) {
			super();
			this.no = no;
			this.q_title = q_title;
			this.q_content = q_content;
			this.q_reg_id = q_reg_id;
			
			this.q_reg_date = q_reg_date;
			this.secret = secret;
		}
		
		//답변 등록 수정용
		public Qna_dto(String no, String a_content, String a_reg_id, String a_reg_date) {
			super();
			this.no = no;
			this.a_content = a_content;
			this.a_reg_id = a_reg_id;
			this.a_reg_date = a_reg_date;
		}





		//답변없건 있건  상세보기
		public Qna_dto(String no, String q_title, String q_content, String q_reg_id, String q_reg_date,
				int hit, String secret,String a_content,String a_reg_date) {
			super();
			this.no = no;
			this.q_title = q_title;
			this.q_content = q_content;
			this.q_reg_id = q_reg_id;
			
			this.q_reg_date = q_reg_date;
			this.a_content = a_content;
			this.secret = secret;
			this.hit = hit;
		
			this.a_reg_date = a_reg_date;
			
		}


		//글쓰기 저장용
		public Qna_dto(String no, String q_title, String q_content, String q_reg_id, String q_reg_date, String secret,
				int hit) {
			super();
			this.no = no;
			this.q_title = q_title;
			this.q_content = q_content;
			this.q_reg_id = q_reg_id;
			this.q_reg_date = q_reg_date;
			this.secret = secret;
			this.hit = hit;
		}


		//전체 리스트 디티오
		public Qna_dto(String no, String q_title, String a_content,  String q_reg_date, int hit, String secret, String q_reg_id) {
			super();
			this.no = no;
			this.q_title = q_title;
			
			this.q_reg_date = q_reg_date;
			this.a_content = a_content;
			this.hit = hit;
			this.secret = secret;
			this.q_reg_id = q_reg_id;
		}
	
	//전부
	public Qna_dto(String no, String q_title, String q_content, String q_reg_id, String q_reg_date, String a_content,
			String a_reg_id, String a_reg_date, String secret, int hit) {
		super();
		this.no = no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_reg_id = q_reg_id;
		this.q_reg_date = q_reg_date;
		this.a_content = a_content;
		this.a_reg_id = a_reg_id;
		this.a_reg_date = a_reg_date;
		this.secret = secret;
		this.hit = hit;
	}


	public String getSecret() {
		return secret;
	}


	public void setSecret(String secret) {
		this.secret = secret;
	}


	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getQ_title() {
		return q_title;
	}


	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}


	public String getQ_content() {
		return q_content;
	}


	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}


	public String getQ_reg_id() {
		return q_reg_id;
	}


	public void setQ_reg_id(String q_reg_id) {
		this.q_reg_id = q_reg_id;
	}


	public String getQ_reg_date() {
		return q_reg_date;
	}


	public void setQ_reg_date(String q_reg_date) {
		this.q_reg_date = q_reg_date;
	}


	public String getA_content() {
		return a_content;
	}


	public void setA_content(String a_content) {
		this.a_content = a_content;
	}


	public String getA_reg_id() {
		return a_reg_id;
	}


	public void setA_reg_id(String a_reg_id) {
		this.a_reg_id = a_reg_id;
	}


	public String getA_reg_date() {
		return a_reg_date;
	}


	public void setA_reg_date(String a_reg_date) {
		this.a_reg_date = a_reg_date;
	}


	public int getHit() {
		return hit;
	}


	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
