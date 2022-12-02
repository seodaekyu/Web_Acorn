package test.boardcomment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.boardcommnet.dto.BoardCommentDto;
import test.book.dto.BookDto;
import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class BoardCommentDao {
   private static BoardCommentDao dao;
   //외부에서 객체 생성할수 없도록
   private BoardCommentDao() {}
   //참조값을 리턴해주는 static 메소드
   public static BoardCommentDao getInstance() {
      if(dao==null) {
         dao=new BoardCommentDao();
      }
      return dao;
   }
   
   // 모든 댓글 정보 가져오기
   public List<BoardCommentDto> getList(){
	   List<BoardCommentDto> list = new ArrayList<>();
	   
	   // 필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT commentnum, boardnum, writer, comment1, TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI:SS') AS regdate"
					+ " FROM board_comment"
					+ " ORDER BY commentnum DESC";
			// sql 문의 ?에 바인딩 할 게 있으면 한다.
	
			pstmt = conn.prepareStatement(sql);
			// SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				BoardCommentDto tmp = new BoardCommentDto();
				tmp.setCommnetNum(rs.getInt("commentnum"));
				tmp.setBoardNum(rs.getInt("boardnum"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setComment1(rs.getString("comment1"));
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
   
   // 댓글 정보 추가
   public boolean insert(BoardCommentDto dto) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_comment"
					+ " (commentnum, boardnum, writer, comment1, regdate)"
					+ " VALUES (board_comment_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
	
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setInt(1, dto.getBoardNum());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getComment1());
			
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
   
   // 댓글 번호로 댓글 정보 삭제
   public boolean cnum_delete(int commentnum) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_comment"
					+ " WHERE commentnum = ?";
	
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setInt(1, commentnum);
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
   
   // 게시글 번호로 댓글 정보 삭제
   public boolean bnum_delete(int boardnum) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
	
		int rowCount = 0;
	
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_comment"
					+ " WHERE boardnum = ?";
	
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩할게 있으면 해주고
			pstmt.setInt(1, boardnum);
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



