package global.sesoc.test.vo;

public class EmailPortalVO {
	// portalNum : 이메일 포털 번호
	private int portalNum;
	// portalName : 사용하는 포털
	private String portalName;

	public EmailPortalVO() {

	}

	public EmailPortalVO(int portalNum, String portalName) {
		super();
		this.portalNum = portalNum;
		this.portalName = portalName;
	}

	public int getPortalNum() {
		return portalNum;
	}

	public void setPortalNum(int portalNum) {
		this.portalNum = portalNum;
	}

	public String getPortalName() {
		return portalName;
	}

	public void setPortalName(String portalName) {
		this.portalName = portalName;
	}

	@Override
	public String toString() {
		return "EmailPortalVO [portalNum=" + portalNum + ", portalName=" + portalName + "]";
	}

}
