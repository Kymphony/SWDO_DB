package global.sesoc.test.vo;

public class GroupBoardVO {
	
	private int groupNum;
	private int bnum_group;
	private String title;
	private String content;
	private String inputdate;
	private String id;
	private String nickname; 
	
	//
	
	public GroupBoardVO(){}

	//
	
	public GroupBoardVO(int groupNum, int bnum_group, String title, String content, 
					  String inputdate, String id, String nickname) 
	{

		this.groupNum = groupNum;
		this.bnum_group = bnum_group;
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
		return bnum_group;
	}

	public void setBnum_group(int bnum_group) {
		this.bnum_group = bnum_group;
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
		return "groupBoard [groupNum=" + groupNum + ", bnum_group=" + bnum_group + ", title=" + title + ", content="
				+ content + ", inputdate=" + inputdate + ", id=" + id + ", nickname=" + nickname + "]";
	}
	
	

}
