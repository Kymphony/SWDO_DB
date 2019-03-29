package global.sesoc.test.vo;

public class EBookNumVO {
	// BookNum : 책 번호 값
	private int BookNum;
	// Title : 책 제목
	private String Title;
	// author : 책 저자
	private String author;
	// publisher : 출판사
	private String publisher;

	public EBookNumVO() {

	}

	public EBookNumVO(int bookNum, String title, String author, String publisher) {
		super();
		BookNum = bookNum;
		Title = title;
		this.author = author;
		this.publisher = publisher;
	}

	public int getBookNum() {
		return BookNum;
	}

	public void setBookNum(int bookNum) {
		BookNum = bookNum;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "EBookNumVO [BookNum=" + BookNum + ", Title=" + Title + ", author=" + author + ", publisher=" + publisher
				+ "]";
	}

}
