package global.sesoc.test.vo;

public class Reply_BookVO {
	
	String title;	//책번호값
	int replynum;	//서평 번호
	String id;		//회원가입된 아이디
	String nickname;//가입된 회원의 별칭
	int point;		//리뷰 점수
	String content;	//서평
	String inputdate;//서평을 남긴 날짜
	String publisher;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	@Override
	public String toString() {
		return "Reply_BookVO [title=" + title + ", replynum=" + replynum + ", id=" + id + ", nickname=" + nickname
				+ ", point=" + point + ", content=" + content + ", inputdate=" + inputdate + ", publisher=" + publisher
				+ "]";
	}
	public Reply_BookVO(String title, int replynum, String id, String nickname, int point, String content,
			String inputdate, String publisher) {
		super();
		this.title = title;
		this.replynum = replynum;
		this.id = id;
		this.nickname = nickname;
		this.point = point;
		this.content = content;
		this.inputdate = inputdate;
		this.publisher = publisher;
	}
	public Reply_BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}