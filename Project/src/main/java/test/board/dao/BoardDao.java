package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.book.dto.BookDto;
import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class BoardDao {
   private static BoardDao dao;
   //외부에서 객체 생성할수 없도록
   private BoardDao() {}
   //참조값을 리턴해주는 static 메소드
   public static BoardDao getInstance() {
      if(dao==null) {
         dao=new BoardDao();
      }
      return dao;
   }
   
   // 글 번호에 따른 데이터 받아오기
   public BoardDto getData(int num) {
	   BoardDto dto = new BoardDto();
	   // 필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT num, writer, title, content, viewCount, TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI:SS') AS regdate"
					+ " FROM board"
					+ " WHERE num = ?";
			// sql 문의 ?에 바인딩 할 게 있으면 한다.
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			// SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
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
  
   // 전체 게시판 데이터 받아오기
   public List<BoardDto> getList() {
	   List<BoardDto> list = new ArrayList<>();
	   // 필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT num, writer, title, content, viewCount, TO_CHAR(regdate, 'YYYY.MM.DD') AS regdate"
					+ " FROM board"
					+ " ORDER BY num DESC";
			// sql 문의 ?에 바인딩 할 게 있으면 한다.
	
			pstmt = conn.prepareStatement(sql);
			// SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				BoardDto tmp = new BoardDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setContent(rs.getString("content"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
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
   
   // 게시판에 데이터 추가
   public boolean insert(BoardDto dto) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " VALUES (board_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
	
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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
   
   // 게시판 데이터 수정
   public boolean update(BoardDto dto) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board"
					+ " SET title=?, content=?"
					+ " WHERE num = ?";
	
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
		
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
   
   // 조회수 올리는 데이터 수정
   public boolean addViewCount(int num) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board"
					+ " SET viewCount = viewCount + 1"
					+ " WHERE num = ?";
	
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setInt(1, num);
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
   
   // 게시판 내용 삭제
   public boolean delete(int num) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board"
					+ " WHERE num = ?";
	
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setInt(1, num);
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



