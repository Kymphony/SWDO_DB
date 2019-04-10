package global.sesoc.test.vo;

public class LibraryVO {
	
	private String LIB_NAME;
	private String LIB_CODE;
	private String REC_KEY;
	
	public LibraryVO(){}

	public LibraryVO(String lIB_NAME, String lIB_CODE, String rEC_KEY) {
		LIB_NAME = lIB_NAME;
		LIB_CODE = lIB_CODE;
		REC_KEY = rEC_KEY;
	}

	public String getLIB_NAME() {
		return LIB_NAME;
	}

	public void setLIB_NAME(String lIB_NAME) {
		LIB_NAME = lIB_NAME;
	}

	public String getLIB_CODE() {
		return LIB_CODE;
	}

	public void setLIB_CODE(String lIB_CODE) {
		LIB_CODE = lIB_CODE;
	}

	public String getREC_KEY() {
		return REC_KEY;
	}

	public void setREC_KEY(String rEC_KEY) {
		REC_KEY = rEC_KEY;
	}

	@Override
	public String toString() {
		return "LibraryVO [LIB_NAME=" + LIB_NAME + ", LIB_CODE=" + LIB_CODE + ", REC_KEY=" + REC_KEY + "]";
	}
	
	}
