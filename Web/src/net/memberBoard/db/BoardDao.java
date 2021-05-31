package net.memberBoard.db;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

//실제로 데이터베이스와 연동하여 레코드의 추가, 수정, 삭제 작업이 이루어지는 클래스
//어떤 Action클래스가 호출되더라도 그에 해당하는 데이터베이스 연동 처리는 Dao클래스에서 이루어짐. 



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
	   
	//글의 개수 구하기
	 public int getListCount() {
		  SqlSession sqlsession =  sqlsessionfactory.openSession();  
		  int x = 0;
		  try {
			  x = sqlsession.selectOne("selectListCount");
			  System.out.println(x+ "성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			  System.out.println("실패");
		}finally {
			sqlsession.close();
		}
		  return x; 
	 }
	 
	 
	 public List<BoardBean> selectBoardAll(HashMap<String, Object>map){ //게시판 리스트에 뿌려줄 정보(여러개의 보드 가져오기)
	     SqlSession sqlSession=sqlsessionfactory.openSession();
	      try {
	      System.out.println("완료 bbb?????");  
	      return sqlSession.selectList("selectBoardAll",map);
	     }catch (Exception e) {
	      // TODO: handle exception
	    	System.out.println("실패bbb");
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
		 /*mybatis객체를 factory 가 만들어줌 */
		  try {
			  sqlsession.insert("insertBoard", boardB);
			  sqlsession.commit();
			  System.out.println("완료 !!!!!!!!!!");
			
		} catch (Exception e) {
			// TODO: handle exception
			 System.out.println("실패 !!!!!!!!!!");
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
			  System.out.println(x+ "성공");
		} catch (Exception e) {
			// TODO: handle exception
			//e.printStackTrace();
			System.out.println("실패");
		}finally {
			sqlsession.close();
		}
		 
		  return x + 1; 
	 }
	
	
	 
	 public static void main(String[] args) {
		BoardDao b = new BoardDao();
		System.out.println(b.getNextNum());
		
		
	}
	 
	 public BoardBean selectBoardOne(int id) { //게시판 뷰에 뿌려줄 정보(하나의 보드 가져오기)
		 SqlSession sqlSession=sqlsessionfactory.openSession();
	      try {
	      System.out.println("완료 bbb");  
	      return sqlSession.selectOne("selectBoardOne", id);
	     }catch (Exception e) {
	      // TODO: handle exception
	    	System.out.println("실패bbb");
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
