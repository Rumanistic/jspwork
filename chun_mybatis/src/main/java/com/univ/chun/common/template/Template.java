package com.univ.chun.common.template;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {
	public static SqlSession getSqlSession() {
		SqlSession sqlSession = null;
		
		// sqlSession을 생성하기 위해서는 SqlSessionFactory가 필요
		// sqlSessionFactory를 사용하기 위해서는 SqlSessionFactoryBuilder가 필요
		String resource = "/mybatis-config.xml";
		try {
			InputStream stream = Resources.getResourceAsStream(resource);
			sqlSession = new SqlSessionFactoryBuilder().build(stream).openSession(false);
			// openSession(): 자동 커밋 여부, 기본값 false;

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return sqlSession;
	}
}
