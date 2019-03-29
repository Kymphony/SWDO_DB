package global.sesoc.test.vo;

public class GroupReplyVO {
	
	private int groupNum;
	private int Bnum_group;
	private int rnum_group;
	private String title;
	private String content;
	private String inputdate;
	private String id;
	private String nickname;

	//
	
	public GroupReplyVO(){}

	//
	
	public GroupReplyVO(int groupNum, int Bnum_group, int rnum_group, String title, 
					  String content, String inputdate, String id, String nickname) 
	{
		this.groupNum = groupNum;
		this.Bnum_group = Bnum_group;
		this.rnum_group = rnum_group;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.id = id;
		this.nickname = nickname;
	}

	//
	
	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public int getBnum_group() {
		return Bnum_group;
	}

	public void setBnum_group(int bnum_group) {
		Bnum_group = bnum_group;
	}

	public int getRnum_group() {
		return rnum_group;
	}

	public void setRnum_group(int rnum_group) {
		this.rnum_group = rnum_group;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	//
	
	@Override
	public String toString() {
		return "groupreply [groupNum=" + groupNum + ", Bnum_group=" + Bnum_group + ", rnum_group=" + rnum_group
				+ ", title=" + title + ", content=" + content + ", inputdate=" + inputdate + ", id=" + id
				+ ", nickname=" + nickname + "]";
	}
	
}
