package ch06;

public class Employee {
	private String EMP_ID;
	private String EMP_NAME;
	private String EMP_NO;
	private String EMAIL;
	private String PHONE;
	private String DEPT_CODE;
	private String JOB_CODE;
	private String SALARY;
	private String BONUS;
	private String MANAGER_ID;
	private String HIRE_DATE;
	private String END_DATE;
	private String ENT_YN;

	public Employee(String EMP_ID, String EMP_NAME, String EMP_NO, String EMAIL, String PHONE, String DEPT_CODE,
			String JOB_CODE, String SALARY, String BONUS, String MANAGER_ID, String HIRE_DATE, String END_DATE,
			String ENT_YN) {
		super();
		this.EMP_ID = EMP_ID;
		this.EMP_NAME = EMP_NAME;
		this.EMP_NO = EMP_NO;
		this.EMAIL = EMAIL;
		this.PHONE = PHONE;
		this.DEPT_CODE = DEPT_CODE;
		this.JOB_CODE = JOB_CODE;
		this.SALARY = SALARY;
		this.BONUS = BONUS;
		this.MANAGER_ID = MANAGER_ID;
		this.HIRE_DATE = HIRE_DATE;
		this.END_DATE = END_DATE;
		this.ENT_YN = ENT_YN;
	}

	public String getEMP_ID() {
		return EMP_ID;
	}
	public void setEMP_ID(String eMP_ID) {
		EMP_ID = eMP_ID;
	}
	public String getEMP_NAME() {
		return EMP_NAME;
	}
	public void setEMP_NAME(String eMP_NAME) {
		EMP_NAME = eMP_NAME;
	}
	public String getEMP_NO() {
		return EMP_NO;
	}
	public void setEMP_NO(String eMP_NO) {
		EMP_NO = eMP_NO;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getDEPT_CODE() {
		return DEPT_CODE;
	}
	public void setDEPT_CODE(String dEPT_CODE) {
		DEPT_CODE = dEPT_CODE;
	}
	public String getJOB_CODE() {
		return JOB_CODE;
	}
	public void setJOB_CODE(String jOB_CODE) {
		JOB_CODE = jOB_CODE;
	}
	public String getSALARY() {
		return SALARY;
	}
	public void setSALARY(String sALARY) {
		SALARY = sALARY;
	}
	public String getBONUS() {
		return BONUS;
	}
	public void setBONUS(String bONUS) {
		BONUS = bONUS;
	}
	public String getMANAGER_ID() {
		return MANAGER_ID;
	}
	public void setMANAGER_ID(String mANAGER_ID) {
		MANAGER_ID = mANAGER_ID;
	}
	public String getHIRE_DATE() {
		return HIRE_DATE;
	}
	public void setHIRE_DATE(String hIRE_DATE) {
		HIRE_DATE = hIRE_DATE;
	}
	public String getEND_DATE() {
		return END_DATE;
	}
	public void setEND_DATE(String eND_DATE) {
		END_DATE = eND_DATE;
	}
	public String getENT_YN() {
		return ENT_YN;
	}
	public void setENT_YN(String eNT_YN) {
		ENT_YN = eNT_YN;
	}
	
	
}
