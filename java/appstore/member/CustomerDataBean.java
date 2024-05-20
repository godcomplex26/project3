package appstore.member;

public class CustomerDataBean {
	private String mem_id; //아이디
	private String mem_pw; //비밀번호
	private String mem_name; //이름
	private String mem_reg_date; //가입일자
	private String mem_tel; //전화번호
	private String mem_model; //스마트폰 기종
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_reg_date() {
		return mem_reg_date;
	}
	public void setMem_reg_date(String mem_reg_date) {
		this.mem_reg_date = mem_reg_date;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_model() {
		return mem_model;
	}
	public void setMem_model(String mem_model) {
		this.mem_model = mem_model;
	}

}
