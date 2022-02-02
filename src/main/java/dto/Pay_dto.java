package dto;

public class Pay_dto {
	
	String order_id, method, method_name, method_no, purchase_date, receipt_id, receipt_url, item_name, id, cancel_yn, no;
	
	int amount;

	public Pay_dto(String order_id, String method, String method_name, String method_no, String purchase_date,
			String receipt_id, String receipt_url, String item_name, String id, int amount,String cancel_yn, String no) {
		super();
		this.order_id = order_id;
		this.method = method;
		this.method_name = method_name;
		this.method_no = method_no;
		this.purchase_date = purchase_date;
		this.receipt_id = receipt_id;
		this.receipt_url = receipt_url;
		this.item_name = item_name;
		this.id = id;
		this.amount = amount;
		this.cancel_yn = cancel_yn;
		this.no = no;
	}

	//조회
	
	public Pay_dto(String order_id, String item_name, String method, String method_name, String method_no,
			String receipt_id, String receipt_url, String purchase_date, int amount, String cancel_yn) {
		super();
		this.order_id = order_id;
		this.item_name = item_name;
		this.method = method;
		this.method_name = method_name;
		this.method_no = method_no;
		this.receipt_id = receipt_id;
		this.receipt_url = receipt_url;
		this.purchase_date = purchase_date;
		this.amount = amount;
		this.cancel_yn = cancel_yn;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getMethod_name() {
		return method_name;
	}

	public void setMethod_name(String method_name) {
		this.method_name = method_name;
	}

	public String getMethod_no() {
		return method_no;
	}

	public void setMethod_no(String method_no) {
		this.method_no = method_no;
	}

	public String getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}

	public String getReceipt_id() {
		return receipt_id;
	}

	public void setReceipt_id(String receipt_id) {
		this.receipt_id = receipt_id;
	}

	public String getReceipt_url() {
		return receipt_url;
	}

	public void setReceipt_url(String receipt_url) {
		this.receipt_url = receipt_url;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCancel_yn() {
		return cancel_yn;
	}

	public void setCancel_yn(String cancel_yn) {
		this.cancel_yn = cancel_yn;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	
}
