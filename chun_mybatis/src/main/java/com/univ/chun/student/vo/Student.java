package com.univ.chun.student.vo;

public class Student {
	private String student_no;
	private String department_no;
	private String student_name;
	private String student_ssn;
	private String student_address;
	private String entrance_date;
	private String absence_yn;
	private String coach_professor_no;
	private String student_pwd;
	
	public Student() {}

	public Student(String student_no, String department_no, String student_name, String student_ssn,
			String student_address, String entrance_date, String absence_yn, String coach_professor_no,
			String student_pwd) {
		super();
		this.student_no = student_no;
		this.department_no = department_no;
		this.student_name = student_name;
		this.student_ssn = student_ssn;
		this.student_address = student_address;
		this.entrance_date = entrance_date;
		this.absence_yn = absence_yn;
		this.coach_professor_no = coach_professor_no;
		this.student_pwd = student_pwd;
	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getDepartment_no() {
		return department_no;
	}

	public void setDepartment_no(String department_no) {
		this.department_no = department_no;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_ssn() {
		return student_ssn;
	}

	public void setStudent_ssn(String student_ssn) {
		this.student_ssn = student_ssn;
	}

	public String getStudent_address() {
		return student_address;
	}

	public void setStudent_address(String student_address) {
		this.student_address = student_address;
	}

	public String getEntrance_date() {
		return entrance_date;
	}

	public void setEntrance_date(String entrance_date) {
		this.entrance_date = entrance_date;
	}

	public String getAbsence_yn() {
		return absence_yn;
	}

	public void setAbsence_yn(String absence_yn) {
		this.absence_yn = absence_yn;
	}

	public String getCoach_professor_no() {
		return coach_professor_no;
	}

	public void setCoach_professor_no(String coach_professor_no) {
		this.coach_professor_no = coach_professor_no;
	}

	public String getStudent_pwd() {
		return student_pwd;
	}

	public void setStudent_pwd(String student_pwd) {
		this.student_pwd = student_pwd;
	}

	@Override
	public String toString() {
		return "Student [student_no=" + student_no + ", department_no=" + department_no + ", student_name="
				+ student_name + ", student_ssn=" + student_ssn + ", student_address=" + student_address
				+ ", entrance_date=" + entrance_date + ", absence_yn=" + absence_yn + ", coach_professor_no="
				+ coach_professor_no + ", student_pwd=" + student_pwd + "]";
	}
	
}
