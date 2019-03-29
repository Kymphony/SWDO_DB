package global.sesoc.test.vo;

public class Buy_userVO {
	// day : 대여 가능 일수
	private int day;
	// inputdate : 도서를 대여한 시점
	private String inputdate;
	// readDate : 읽기 시작한 날짜
	private String readDate;
	// id : 회원가입된 아이디
	private String id;
	// nickname : 가입된 회원의 별칭
	private String nickname;
	// BookNum : 책 번호 값
	private int BookNum;

	public Buy_userVO() {

	}

	public Buy_userVO(int day, String inputdate, String readDate, String id, String nickname, int bookNum) {
		super();
		this.day = day;
		this.inputdate = inputdate;
		this.readDate = readDate;
		this.id = id;
		this.nickname = nickname;
		BookNum = bookNum;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getReadDate() {
		return readDate;
	}

	public void setReadDate(String readDate) {
		this.readDate = readDate;
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

	@Override
	public String toString() {
		return "Buy_userVO [day=" + day + ", inputdate=" + inputdate + ", readDate=" + readDate + ", id=" + id
				+ ", nickname=" + nickname + ", BookNum=" + BookNum + "]";
	}

}
