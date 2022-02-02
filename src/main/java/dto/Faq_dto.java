package dto;

public class Faq_dto {
	private String no, important, title, content;
//전체
	public Faq_dto(String no, String important, String title, String content) {
		super();
		this.no = no;
		this.important = important;
		this.title = title;
		this.content = content;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getImportant() {
		return important;
	}
	public void setImportant(String important) {
		this.important = important;
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
	
	
}
