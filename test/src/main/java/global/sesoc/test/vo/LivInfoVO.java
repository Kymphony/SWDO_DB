package global.sesoc.test.vo;

public class LivInfoVO {

	private String LIB_NAME;
	private String TEL;
	private String ADDRESS;
	private String HOMEPAGE;
	
	
	public LivInfoVO(){}
	
	public LivInfoVO(String lIB_NAME, String tEL, String aDDRESS, String hOMEPAGE) {
		
		LIB_NAME = lIB_NAME;
		TEL = tEL;
		ADDRESS = aDDRESS;
		HOMEPAGE = hOMEPAGE;
	}

	public String getLIB_NAME() {
		return LIB_NAME;
	}
	public void setLIB_NAME(String lIB_NAME) {
		LIB_NAME = lIB_NAME;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getHOMEPAGE() {
		return HOMEPAGE;
	}
	public void setHOMEPAGE(String hOMEPAGE) {
		HOMEPAGE = hOMEPAGE;
	}
	
	@Override
	public String toString() {
		return "LivInfoVO [LIB_NAME=" + LIB_NAME + ", TEL=" + TEL + ", ADDRESS=" + ADDRESS + ", HOMEPAGE=" + HOMEPAGE
				+ "]";
	}
	
}
