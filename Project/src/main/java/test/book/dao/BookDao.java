package test.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.book.dto.BookDto;
import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class BookDao {
   private static BookDao dao;
   //외부에서 객체 생성할수 없도록
   private BookDao() {}
   //참조값을 리턴해주는 static 메소드
   public static BookDao getInstance() {
      if(dao==null) {
         dao=new BookDao();
      }
      return dao;
   }
   
   public List<BookDto> getList() {
	   List<BookDto> list = new ArrayList<>();
	   // 필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT num, name, publisher, author, TO_CHAR(publicationdate, 'YYYY.MM.DD') AS publicationdate"
					+ " FROM book"
					+ " ORDER BY num DESC";
			// sql 문의 ?에 바인딩 할 게 있으면 한다.
	
			pstmt = conn.prepareStatement(sql);
			// SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				BookDto tmp = new BookDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setName(rs.getString("name"));
				tmp.setPublisher(rs.getString("publisher"));
				tmp.setAuthor(rs.getString("author"));
				tmp.setPublicationDate(rs.getString("publicationdate"));
				list.add(tmp);
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
		return list;
   }
   
   public boolean insert(BookDto dto) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	   
	      int rowCount = 0;
	   
	      try {
	         conn = new DbcpBean().getConn();
	         String sql = "INSERT INTO book"
	               +" (num, name, publisher, author, publicationdate)"
	               + " VALUES(book_seq.NEXTVAL, ?, ?, ?, ?)";
	   
	         pstmt = conn.prepareStatement(sql);
	         // ?에 바인딩할게 있으면 해주고
	         pstmt.setString(1, dto.getName());
	         pstmt.setString(2, dto.getPublisher());
	         pstmt.setString(3, dto.getAuthor());
	         pstmt.setString(4, dto.getPublicationDate());
	         // INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW의 갯수 리턴 받기
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
  
}



