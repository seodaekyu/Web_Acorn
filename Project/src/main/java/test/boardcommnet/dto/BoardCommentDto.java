package test.boardcommnet.dto;

public class BoardCommentDto {
	private int commnetNum;
	private int boardNum;
	private String writer;
	private String comment1;
	private String regdate;
	
	public BoardCommentDto() {}

	public BoardCommentDto(int commnetNum, int boardNum, String writer, String comment1, String regdate) {
		super();
		this.commnetNum = commnetNum;
		this.boardNum = boardNum;
		this.writer = writer;
		this.comment1 = comment1;
		this.regdate = regdate;
	}

	public int getCommnetNum() {
		return commnetNum;
	}

	public void setCommnetNum(int commnetNum) {
		this.commnetNum = commnetNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getComment1() {
		return comment1;
	}

	public void setComment1(String comment1) {
		this.comment1 = comment1;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
