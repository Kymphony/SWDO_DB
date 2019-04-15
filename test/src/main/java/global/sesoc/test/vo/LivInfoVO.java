package global.sesoc.test.vo;

public class LivInfoVO {

	private String NAME;
	private String TEL;
	private String ADDRESS;
	private String HOMEPAGE;
	
	
	public LivInfoVO(){}
	
	public LivInfoVO(String nAME, String tEL, String aDDRESS, String hOMEPAGE) {
		
		NAME = nAME;
		TEL = tEL;
		ADDRESS = aDDRESS;
		HOMEPAGE = hOMEPAGE;
	}

	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
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
		return "LivInfoVO [NAME=" + NAME + ", TEL=" + TEL + ", ADDRESS=" + ADDRESS + ", HOMEPAGE=" + HOMEPAGE
				+ "]";
	}
	
}
