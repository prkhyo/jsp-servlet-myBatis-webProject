package net.memberBoard.db;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

//������ �����ͺ��̽��� �����Ͽ� ���ڵ��� �߰�, ����, ���� �۾��� �̷������ Ŭ����
//� ActionŬ������ ȣ��Ǵ��� �׿� �ش��ϴ� �����ͺ��̽� ���� ó���� DaoŬ�������� �̷����. 



public class BoardDao {
	private SqlSessionFactory sqlsessionfactory;
	private static BoardDao dao;
	
	public BoardDao() {
	      sqlsessionfactory = SqlSessionFactoryManager.getSqlSessionFactory();
	      System.out.println(sqlsessionfactory);
	   }
	
	
	   public static BoardDao getOracleDao() {
	      if(dao==null) {
	         dao=new BoardDao();
	      }
	      return dao;      
	   }
	   
	//���� ���� ���ϱ�
	 public int getListCount() {
		  SqlSession sqlsession =  sqlsessionfactory.openSession();  
		  int x = 0;
		  try {
			  x = sqlsession.selectOne("selectListCount");
			  System.out.println(x+ "����");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			  System.out.println("����");
		}finally {
			sqlsession.close();
		}
		  return x; 
	 }
	 
	 
	 public List<BoardBean> selectBoardAll(HashMap<String, Object>map){ //�Խ��� ����Ʈ�� �ѷ��� ����(�������� ���� ��������)
	     SqlSession sqlSession=sqlsessionfactory.openSession();
	      try {
	      System.out.println("�Ϸ� bbb?????");  
	      return sqlSession.selectList("selectBoardAll",map);
	     }catch (Exception e) {
	      // TODO: handle exception
	    	System.out.println("����bbb");
	        e.printStackTrace();
	     }finally {
	      sqlSession.close();
	     }
	     return null;
	 }
	 
	 public Integer getTotalRow(HashMap<String, Object> map) {
		  
		  return sqlsessionfactory.openSession().selectOne("getTotalRow",map);
	  }
	  
	
	 public void boardInsertDB(BoardBean boardB) {
		 SqlSession sqlsession =  sqlsessionfactory.openSession();  
		 /*mybatis��ü�� factory �� ������� */
		  try {
			  sqlsession.insert("insertBoard", boardB);
			  sqlsession.commit();
			  System.out.println("�Ϸ� !!!!!!!!!!");
			
		} catch (Exception e) {
			// TODO: handle exception
			 System.out.println("���� !!!!!!!!!!");
			e.printStackTrace();
			sqlsession.rollback();
			
		}finally {
			sqlsession.close();
			
		}
	  }
	 
	 public int getNextNum() {
		 
		 SqlSession sqlsession =  sqlsessionfactory.openSession();  
		  int x = 0;
		  try {
			  x = sqlsession.selectOne("getNum");
			  System.out.println(x+ "����");
		} catch (Exception e) {
			// TODO: handle exception
			//e.printStackTrace();
			System.out.println("����");
		}finally {
			sqlsession.close();
		}
		 
		  return x + 1; 
	 }
	
	
	 
	 public static void main(String[] args) {
		BoardDao b = new BoardDao();
		System.out.println(b.getNextNum());
		
		
	}
	 
	 public BoardBean selectBoardOne(int id) { //�Խ��� �信 �ѷ��� ����(�ϳ��� ���� ��������)
		 SqlSession sqlSession=sqlsessionfactory.openSession();
	      try {
	      System.out.println("�Ϸ� bbb");  
	      return sqlSession.selectOne("selectBoardOne", id);
	     }catch (Exception e) {
	      // TODO: handle exception
	    	System.out.println("����bbb");
	        e.printStackTrace();
	     }finally {
	      sqlSession.close();
	     }
	     return null;
	 }
	 
	 
	  public void deleteBoard(int boardNum) {
	      SqlSession sqlSession=null;
	      try {
	         sqlSession=sqlsessionfactory.openSession();
	         sqlSession.delete("deleteBoard", boardNum);
	         sqlSession.commit();         
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         sqlSession.close();
	      }   
	   }
	  
}
