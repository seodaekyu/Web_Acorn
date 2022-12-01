package test.book.dto;

public class BookDto {
	private int num;
	private String name;
	private String publisher;
	private String author;
	private String publicationDate;
	
	public BookDto() {}
	
	public BookDto(int num, String name, String publisher, String author, String publicationDate) {
		super();
		this.num = num;
		this.name = name;
		this.publisher = publisher;
		this.author = author;
		this.publicationDate = publicationDate;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}	
	
	
}
