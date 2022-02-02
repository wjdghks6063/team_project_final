package dto;

public class Notice_dto {
	private String no, title, content, reg_date, reg_id, attatch;
	private int hit,important;
	
	//수정
	public Notice_dto(String no, String title, String content, String reg_date, String reg_id, String attatch,
			int important) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.reg_id = reg_id;
		this.attatch = attatch;
		this.important = important;
	}
	
	//전체, 상세, 글쓰기, 뷰
	public Notice_dto(String no, String title, String content, String reg_date, String reg_id, String attatch,
			int hit,int important) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.reg_id = reg_id;
		this.attatch = attatch;
		this.hit = hit;
		this.important = important;
	}
	
	

	public int getImportant() {
		return important;
	}

	public void setImportant(int important) {
		this.important = important;
	}

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getAttatch() {
		return attatch;
	}
	public void setAttatch(String attatch) {
		this.attatch = attatch;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
