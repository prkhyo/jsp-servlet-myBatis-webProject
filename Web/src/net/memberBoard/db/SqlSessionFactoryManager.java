package net.memberBoard.db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryManager {
//SqlSession: myBatis 객체	
//myBatis 객체를 만드는 공장 관리 클래스
//읽어온 
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("net/memberBoard/db/Config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
		
	}
	
	
}
