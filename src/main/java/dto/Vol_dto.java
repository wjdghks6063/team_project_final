package dto;

public class Vol_dto {
	String no,title, voname,volunteersite,start_date,end_date,content,attach,local,reg_id,reg_name ;
	int goal,total,hit,dum;
	
	
	
	//수정용
	public Vol_dto(String no, String title, String voname, String volunteersite, String end_date, String content,
			String attach, String local, int goal) {
		super();
		this.no = no;
		this.title = title;
		this.voname = voname;
		this.volunteersite = volunteersite;
		this.end_date = end_date;
		this.content = content;
		this.attach = attach;
		this.local = local;
		this.goal = goal;
	}

	//전체
	public Vol_dto(String no, String title, String voname, String volunteersite, String start_date, String end_date,
			String content, String attach, String local, int goal, int total, int hit) {
		super();
		this.no = no;
		this.title = title;
		this.voname = voname;
		this.volunteersite = volunteersite;
		this.start_date = start_date;
		this.end_date = end_date;
		this.content = content;
		this.attach = attach;
		this.local = local;
		this.goal = goal;
		this.total = total;
		this.hit = hit;
	}

	//글쓰기	
	public Vol_dto(String no, String title, String voname, String volunteersite, String start_date, String end_date,
			String content, String attach, String local, int goal, int total, int hit, String reg_id, int dum) {
		super();
		
		this.no = no;
		this.title = title;
		this.voname = voname;
		this.volunteersite = volunteersite;
		this.start_date = start_date;
		this.end_date = end_date;
		this.content = content;
		this.attach = attach;
		this.local = local;
		this.reg_id = reg_id;
		this.goal = goal;
		this.total = total;
		this.hit = hit;
		this.dum = dum;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_name() {
		return reg_name;
	}

	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}

	public int getDum() {
		return dum;
	}

	public void setDum(int dum) {
		this.dum = dum;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
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

	public String getVoname() {
		return voname;
	}

	public void setVoname(String voname) {
		this.voname = voname;
	}

	public String getVolunteersite() {
		return volunteersite;
	}

	public void setVolunteersite(String volunteersite) {
		this.volunteersite = volunteersite;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEne_date(String end_date) {
		this.end_date = end_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
