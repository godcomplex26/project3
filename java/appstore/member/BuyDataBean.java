package appstore.member;

public class BuyDataBean {
	private Long buy_id; // 구매아이디
	private String buy_mem_id; // 구매자
	private int buy_app_id; // 구매된 앱 아이디
	private String buy_app_name; // 구매된 앱이름
	private int buy_price; // 판매가
	private String buy_date; // 구매일자
	private String buy_bank; // 결제수단
	private int buy_score; // 별점
	private String buy_dev_id; // 구매 개발자 아이디
	
	public Long getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(Long buy_id) {
		this.buy_id = buy_id;
	}
	public String getBuy_mem_id() {
		return buy_mem_id;
	}
	public void setBuy_mem_id(String buy_mem_id) {
		this.buy_mem_id = buy_mem_id;
	}
	public int getBuy_app_id() {
		return buy_app_id;
	}
	public void setBuy_app_id(int buy_app_id) {
		this.buy_app_id = buy_app_id;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public int getBuy_score() {
		return buy_score;
	}
	public void setBuy_score(int buy_score) {
		this.buy_score = buy_score;
	}
	public String getBuy_bank() {
		return buy_bank;
	}
	public void setBuy_bank(String buy_bank) {
		this.buy_bank = buy_bank;
	}
	public String getBuy_app_name() {
		return buy_app_name;
	}
	public void setBuy_app_name(String buy_app_name) {
		this.buy_app_name = buy_app_name;
	}
	public String getBuy_dev_id() {
		return buy_dev_id;
	}
	public void setBuy_dev_id(String buy_dev_id) {
		this.buy_dev_id = buy_dev_id;
	}
	

}
	