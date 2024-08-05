package com.univ.chun.student.service;

import org.apache.ibatis.session.SqlSession;

import com.univ.chun.common.template.Template;
import com.univ.chun.student.dao.StudentDao;
import com.univ.chun.student.vo.Student;

public class StudentServiceImpl implements StudentService {
	private StudentDao sDao = new StudentDao();

	@Override
	public Student doLogin(Student std) {
		SqlSession sSess = Template.getSqlSession();
		Student stdLogin = sDao.doLogin(sSess, std);
		return stdLogin;
	}

}
