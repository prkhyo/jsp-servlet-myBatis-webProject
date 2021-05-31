package net.memberBoard.db;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.memberBoard.db.SqlSessionFactoryManager;

//������ �����ͺ��̽��� �����Ͽ� ���ڵ��� �߰�, ����, ���� �۾��� �̷������ Ŭ����
//� ActionŬ������ ȣ��Ǵ��� �׿� �ش��ϴ� �����ͺ��̽� ���� ó���� DaoŬ�������� �̷����. 



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
	   
	   //�α��� �õ��� ���̵� �����ϴ� ���̵� �ƴϸ�  false��ȯ
	   //�����ϴ� ���̵���, �� ���̵� �˸��� ��й�ȣ�� �Է����� ���  true ��ȯ, �ƴϸ� false��ȯ
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
		   if(dbId!=null &&(MEMBER_ID.equals(dbId))) { //�����ϴ� ���̵��� ���
			   System.out.println("���� !");
			   return true;
		   }
		   System.out.println("���� ���̵� !");
		   return false;
	   } 
	   
	
	   
	   
			  
	public void memberInsertDB(MemberBean memberB) {
		 SqlSession sqlsession =  sqlsessionfactory.openSession();  
		 /*mybatis��ü�� factory �� ������� */
		  try {
			  sqlsession.insert("insertMember", memberB);
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
	
	
	 public List<MemberBean> selectMemberAll(String id){
	     SqlSession sqlSession=sqlsessionfactory.openSession();
	      try {
	      System.out.println("�Ϸ� bbb");  
	      return sqlSession.selectList("selectMemberAll",id);
	     }catch (Exception e) {
	      // TODO: handle exception
	    	System.out.println("����bbb");
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
	 
	 
	 
	 
}
