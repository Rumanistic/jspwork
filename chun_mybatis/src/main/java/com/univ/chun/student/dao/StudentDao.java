package com.univ.chun.student.dao;

import org.apache.ibatis.session.SqlSession;

import com.univ.chun.student.vo.Student;

public class StudentDao {

	public Student doLogin(SqlSession sSess, Student std) {
		System.out.println(std);
		return sSess.selectOne("sMapper.doLogin", std);
	}

}
