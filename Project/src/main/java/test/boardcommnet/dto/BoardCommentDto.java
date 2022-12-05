package test.boardcommnet.dto;

public class BoardCommentDto {
	private int commentNum;
	private int boardNum;
	private String writer;
	private String comment1;
	private String regdate;
	
	public BoardCommentDto() {}

	public BoardCommentDto(int commentNum, int boardNum, String writer, String comment1, String regdate) {
		super();
		this.commentNum = commentNum;
		this.boardNum = boardNum;
		this.writer = writer;
		this.comment1 = comment1;
		this.regdate = regdate;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
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
