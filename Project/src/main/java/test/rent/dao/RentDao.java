package test.rent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.book.dto.BookDto;
import test.rent.dto.RentDto;
import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class RentDao {
   private static RentDao dao;
   //외부에서 객체 생성할수 없도록
   private RentDao() {}
   //참조값을 리턴해주는 static 메소드
   public static RentDao getInstance() {
      if(dao==null) {
         dao=new RentDao();
      }
      return dao;
   }
  
   // 책 번호에 따른 대여 내역 불러오기 (대출 가능여부)
   public RentDto BookNum_getDate(int num) {
	   RentDto dto = null;
	   // 필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT rentnum, id, TO_CHAR(rentdate, 'YYYY.MM.DD') AS rentdate, TO_CHAR(returndate, 'YYYY.MM.DD HH24:MI:SS') AS returndate, TO_CHAR(returncompletedate, 'YYYY.MM.DD') AS returncompletedate"
					+ " FROM rent"
					+ " WHERE booknum = ? "
					+ " AND returncompletedate IS NULL";
			// sql 문의 ?에 바인딩 할 게 있으면 한다.
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			// SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				dto = new RentDto();
				dto.setRentnum(rs.getInt("rentnum"));
				dto.setId(rs.getString("id"));
				dto.setRentdate(rs.getString("rentdate"));
				dto.setReturndate(rs.getString("returndate"));
				dto.setReturncompletedate(rs.getString("returncompletedate"));
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
		return dto;
   }
   
   // ID에 따른 대여 내역 불러오기
   public List<RentDto> ID_getDate(String id) {
	   List<RentDto> list = new ArrayList<>();
	   // 필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT rentnum, booknum, TO_CHAR(rentdate, 'YYYY.MM.DD') AS rentdate, TO_CHAR(returndate, 'YYYY.MM.DD HH24:MI:SS') AS returndate, TO_CHAR(returncompletedate, 'YYYY.MM.DD') AS returncompletedate"
					+ " FROM rent"
					+ " WHERE id = ?";
			// sql 문의 ?에 바인딩 할 게 있으면 한다.
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			// SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				RentDto dto = new RentDto();
				dto.setRentnum(rs.getInt("rentnum"));
				dto.setBooknum(rs.getInt("booknum"));
				dto.setRentdate(rs.getString("rentdate"));
				dto.setReturndate(rs.getString("returndate"));
				dto.setReturncompletedate(rs.getString("returncompletedate"));
				list.add(dto);
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
   
   // 대여 내역 추가
   public boolean insert(RentDto dto) {
	  Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO rent"
					+ " (rentnum, booknum, id, rentdate, returndate)"
					+ " VALUES(bookrent_seq.NEXTVAL, ?, ?, SYSDATE, SYSDATE+7)";
			// sql 문의 ?에 바인딩 할 게 있으면 한다.
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setInt(1, dto.getBooknum());
			pstmt.setString(2, dto.getId());
		
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
   
   // 대출 반납에 대한 반납완료일자 업데이트
   public boolean update(int rentnum) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE rent"
					+ " SET returncompletedate = SYSDATE"
					+ " WHERE rentnum=?";
	
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setInt(1, rentnum);
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



