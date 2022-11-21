package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
   
   private static UsersDao dao;
   //외부에서 객체 생성할수 없도록
   private UsersDao() {}
   //참조값을 리턴해주는 static 메소드
   public static UsersDao getInstance() {
      if(dao==null) {
         dao=new UsersDao();
      }
      return dao;
   }
   //회원 한명의 정보를 DB 에 저장하고 성공여부를 리턴하는 메소드 
   public boolean insert(UsersDto dto) {//UsersDto 에 id, pwd, email 이 있다. 
      Connection conn = null;
      PreparedStatement pstmt = null;
      int rowCount = 0;
      try {
         conn = new DbcpBean().getConn();
         String sql = "INSERT INTO users"
               + " (id, pwd, email, regdate)"
               + " VALUES(?, ?, ?, SYSDATE)";
         pstmt = conn.prepareStatement(sql);
         // ? 에 바인딩할게 있으면 해주고
         pstmt.setString(1, dto.getId());
         pstmt.setString(2, dto.getPwd());
         pstmt.setString(3, dto.getEmail());
         // INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
         rowCount = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
         }
      }
      if (rowCount > 0) {
         return true;
      } else {
         return false;
      }
   }
   
   // 인자로 전다로디는 dto에 있는 아이디와 비밀번호를 이용해서 해당 정보가 유효한 정보인지 여부를 리턴하는 메소드
   public boolean isValid(UsersDto dto) {
	      // 필요한 객체를 담을 지역변수를 미리 만들어 둔다
	   	  Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      // 아이디 비밀번호 유효성 여부를 담을 변수 만들고 초기값 false 부여하기
	      boolean isValid = false;
	      try {
	         //Connection 객체의 참조값 얻어오기 
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 작성
	         String sql = "SELECT id, pwd"
	               + " FROM users"
	               + " WHERE id=?"
	               + " AND pwd = ?";
	         //PreparedStatement 객체의 참조값 얻어오기
	         pstmt = conn.prepareStatement(sql);
	         //? 에 바인딩할 내용이 있으면 여기서 바인딩
	         pstmt.setString(1, dto.getId());
	         pstmt.setString(2, dto.getPwd());
	         //select 문 수행하고 결과를 ResultSet 으로 받아오기
	         rs = pstmt.executeQuery();
	         //SELECT 된 ROW가 있는지 확인해 본다.
	         if (rs.next()) {
	        	 // SELECT 된 row가 있다면 유효한 정보가 맞다.
	            isValid = true;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      return isValid;
	   }
}



