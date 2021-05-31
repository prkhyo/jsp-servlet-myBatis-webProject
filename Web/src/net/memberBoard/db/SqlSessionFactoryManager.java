package net.memberBoard.db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryManager {
//SqlSession: myBatis ��ü	
//myBatis ��ü�� ����� ���� ���� Ŭ����
//�о�� 
	
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
