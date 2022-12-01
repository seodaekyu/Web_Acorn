package test.rent.dto;

public class RentDto {
	private int rentnum;
	private int booknum;
	private String id;
	private String rentdate;
	private String returndate;
	
	public RentDto() {}
	
	public RentDto(int rentnum, int booknum, String id, String rentdate, String returndate) {
		super();
		this.rentnum = rentnum;
		this.booknum = booknum;
		this.id = id;
		this.rentdate = rentdate;
		this.returndate = returndate;
	}

	public int getRentnum() {
		return rentnum;
	}

	public void setRentnum(int rentnum) {
		this.rentnum = rentnum;
	}

	public int getBooknum() {
		return booknum;
	}

	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRentdate() {
		return rentdate;
	}

	public void setRentdate(String rentdate) {
		this.rentdate = rentdate;
	}

	public String getReturndate() {
		return returndate;
	}

	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}
	
	
	
}
