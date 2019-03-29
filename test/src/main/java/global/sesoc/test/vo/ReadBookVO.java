package global.sesoc.test.vo;

public class ReadBookVO {
	
	private int bookPage;
	private String id;
	private String nickname;
	private int BookNum;
	private String inputdate;
	
	//
	
	public ReadBookVO(){}

	//
	
	public ReadBookVO(int bookPage, String id, String nickname, int BookNum, String inputdate) 
	{
		
		this.bookPage = bookPage;
		this.id = id;
		this.nickname = nickname;
		this.BookNum = BookNum;
		this.inputdate = inputdate;
	}

	//
	
	public int getBookPage() {
		return bookPage;
	}

	public void setBookPage(int bookPage) {
		this.bookPage = bookPage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getBookNum() {
		return BookNum;
	}

	public void setBookNum(int bookNum) {
		BookNum = bookNum;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	//
	
	@Override
	public String toString() {
		return "readBook [bookPage=" + bookPage + ", id=" + id + ", nickname=" + nickname + ", BookNum=" + BookNum
				+ ", inputdate=" + inputdate + "]";
	}
	
}
