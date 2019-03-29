package global.sesoc.test.vo;

public class Group_userVO {
	
	private int groupNum;
	private String groupName;
	
	//
	
	public Group_userVO(){}

	//
	
	public Group_userVO(int groupNum, String groupName) 
	{
		this.groupNum = groupNum;
		this.groupName = groupName;
	}
	
	//

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	//
	
	@Override
	public String toString() {
		return "Group_user [groupNum=" + groupNum + ", groupName=" + groupName + "]";
	}
	
	//
	
	
}
