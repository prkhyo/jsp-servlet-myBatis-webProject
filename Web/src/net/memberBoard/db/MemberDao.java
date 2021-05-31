package net.memberBoard.db;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.memberBoard.db.SqlSessionFactoryManager;

//실제로 데이터베이스와 연동하여 레코드의 추가, 수정, 삭제 작업이 이루어지는 클래스
//어떤 Action클래스가 호출되더라도 그에 해당하는 데이터베이스 연동 처리는 Dao클래스에서 이루어짐. 



public class MemberDao {
	private SqlSessionFactory sqlsessionfactory;
	private static MemberDao dao;
	
	public MemberDao() {
	      sqlsessionfactory = SqlSessionFactoryManager.getSqlSessionFactory();
	      System.out.println(sqlsessionfactory);
	   }
	
	
	   public static MemberDao getOracleDao() {
	      if(dao==null) {
	         dao=new MemberDao();
	      }
	      return dao;      
	   }
	   
	   //로그인 시도한 아이디가 존재하는 아이디가 아니면  false반환
	   //존재하는 아이디라면, 그 아이디에 알맞은 비밀번호를 입력했을 경우  true 반환, 아니면 false반환
	   public boolean idPwCheckMember(String MEMBER_ID, String MEMBER_PW) {
			SqlSession sqlsession =  sqlsessionfactory.openSession();
			String dbId = sqlsession.selectOne("idCheckMember",MEMBER_ID);
			if(dbId==null || !(dbId!=null&&(MEMBER_ID.equals(dbId)))) {
				return false;
			}
			String dbPw = sqlsession.selectOne("pwCheckMember",MEMBER_ID);
			
			  return dbPw!=null && MEMBER_PW.equals(dbPw);
			 } 
	   
	   public boolean idCheckMember(String MEMBER_ID) {
		   SqlSession sqlsession =  sqlsessionfactory.openSession();
		   String dbId = sqlsession.selectOne("idCheckMember",MEMBER_ID);
		   if(dbId!=null &&(MEMBER_ID.equals(dbId))) { //존재하는 아이디일 경우
			   System.out.println("존재 !");
			   return true;
		   }
		   System.out.println("없는 아이디 !");
		   return false;
	   } 
	   
	
	   
	   
			  
	public void memberInsertDB(MemberBean memberB) {
		 SqlSession sqlsession =  sqlsessionfactory.openSession();  
		 /*mybatis객체를 factory 가 만들어줌 */
		  try {
			  sqlsession.insert("insertMember", memberB);
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
	
	
	 public List<MemberBean> selectMemberAll(String id){
	     SqlSession sqlSession=sqlsessionfactory.openSession();
	      try {
	      System.out.println("완료 bbb");  
	      return sqlSession.selectList("selectMemberAll",id);
	     }catch (Exception e) {
	      // TODO: handle exception
	    	System.out.println("실패bbb");
	        e.printStackTrace();
	     }finally {
	      sqlSession.close();
	     }
	     return null;
	 }
	 
	 
	 public void deleteMember(HashMap<String, String>map) {
		  
		  SqlSession sqlsession =  sqlsessionfactory.openSession();  
			
			  try {
				  sqlsession.delete("deleteMember",map);
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
	 
	 
	 
	 
}
