package global.sesoc.test.vo;

public class CommunityVO {
	// id : 회원가입된 아이디
	private String id;
	// nickname : 가입된 회원의 별칭
	private String nickname;
	// groupNum : 그룹 번호
	private int groupNum;
	// group_master : 그룹 마스터
	// 일반 회원은 0
	// 그룹 마스터는 1
	private int group_master;

	public CommunityVO() {

	}

	public CommunityVO(String id, String nickname, int groupNum, int group_master) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.groupNum = groupNum;
		this.group_master = group_master;
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

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public int getGroup_master() {
		return group_master;
	}

	public void setGroup_master(int group_master) {
		this.group_master = group_master;
	}

	@Override
	public String toString() {
		return "CommunityVO [id=" + id + ", nickname=" + nickname + ", groupNum=" + groupNum + ", group_master="
				+ group_master + "]";
	}

}
