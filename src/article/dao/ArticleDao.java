package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.Writer;
import jdbc.JdbcUtil;

public class ArticleDao {
	
	
	public int update(Connection conn, int no, String title, String content) throws SQLException {
		String sql = "UPDATE article "
				+ "SET title = ?, content = ?, moddate=SYSDATE "
				+ "WHERE article_no=?";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, no);
			
			int cnt = pstmt.executeUpdate();
			return cnt;
		}
	}
	
	
	public void delete(Connection con, int no) throws SQLException {
		String sql = "DELETE article WHERE article_no=?";
		
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
		}
	}
	
	
	public List<Article> search (Connection conn, int pageNum, int size, String search) {
		List<Article> list = new ArrayList<Article>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT rn, title, article_no " + 
				"FROM (SELECT title, article_no, ROW_NUMBER() " + 
				"OVER (ORDER BY article_no DESC) rn FROM article WHERE title LIKE ? ) WHERE rn BETWEEN ? AND ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+search+'%');
			pstmt.setInt(2, (pageNum-1) * size + 1);
			pstmt.setInt(3, pageNum * size);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Article article = new Article();
				article.setNo(rs.getInt(1));
				article.setTitle(rs.getString(2));
				
				
				list.add(article);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	
	}
	
	
	
	public List<Article> selectNew4 (Connection conn, String category) {
		
		List<Article> list = new ArrayList<Article>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ROWNUM, article_no, title FROM (SELECT * FROM article WHERE category= ? ORDER BY article_no DESC) WHERE ROWNUM <= 4";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Article article = new Article();
				article.setNo(rs.getInt(2));
				article.setTitle(rs.getString(3));
				
				list.add(article);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	public Article selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * "
				+ "FROM article "
				+ "WHERE article_no=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			Article article = null;
			
			if (rs.next()) {
				article = convertArticle(rs);
			}
			return article;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
		
	}
	
	public Article insert(Connection conn, Article article) 
			throws SQLException {
		// 12c 이상
		String sql = "INSERT INTO article "
				+ "(category, writer_id, writer_name, title, content,"
				+ " regdate, moddate, read_cnt) "
				+ "VALUES (?, ?, ?, ?, ?, SYSDATE, SYSDATE, 0)";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql,
							new String[] {"article_no", "regdate", "moddate"});
			
			pstmt.setString(1, article.getCategory());
			pstmt.setString(2, article.getWriter().getId());
			pstmt.setString(3, article.getWriter().getName());
			pstmt.setString(4, article.getTitle());
			pstmt.setString(5, article.getContent());
			
			int cnt = pstmt.executeUpdate();
			
			if (cnt == 1) {
				rs = pstmt.getGeneratedKeys();
				int key = 0;
				Date regDate = null;
				Date modDate = null;
				if (rs.next()) {
					key = rs.getInt(1);
					regDate = rs.getTimestamp(2);
					modDate = rs.getTimestamp(3);
				}
				return new Article(
						article.getCategory(),
						key,
						article.getWriter(),
						article.getTitle(),
						article.getContent(),
						regDate,
						modDate,
						0);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}
	
	public void increaseReadCount(Connection conn, int no) throws SQLException {
		String sql = "UPDATE article "
				+ "SET read_cnt=read_cnt+1 "
				+ "WHERE article_no=?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		String sql = "SELECT COUNT(*) FROM article";
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}
	
	
	public List<Article> select(Connection conn, int pageNum, int size, String category)
		throws SQLException {
			System.out.println("rs1" + pageNum);
			System.out.println("rs2" + size);
			
			/*
			String sql = "SELECT * "
					+ "FROM article "
					+ "ORDER BY articl_no DESC "
					+ "LIMIT ?, ?"; // 시작 row_num(zerobase), 갯수
			*/
			String sql = "SELECT rn, category, article_no, writer_id, writer_name, title, content, regdate, moddate, read_cnt "
					+ "FROM (SELECT category, article_no, writer_id, writer_name, title, content, regdate, moddate, read_cnt, ROW_NUMBER() "
					+ "OVER (ORDER BY article_no DESC) rn FROM article WHERE category=? ) WHERE rn BETWEEN ? AND ?";
			
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, (pageNum-1) * size + 1);
				pstmt.setInt(3, pageNum * size);
				
				System.out.println((pageNum-1) * size + 1);
				System.out.println(pageNum * size);
				
				rs = pstmt.executeQuery();
				List<Article> result = new ArrayList<>();
				while (rs.next()) {
					System.out.println("rs" + rs);
					result.add(convertArticle(rs));
				}
				
				return result;
			} finally {
				JdbcUtil.close(rs, pstmt);
			}
	}
		
	
	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(
					rs.getString("category"),
					rs.getInt("article_no"),
					new Writer(
							rs.getString("writer_id"),
							rs.getString("writer_name")
							),
					rs.getString("title"),
					rs.getString("content"),
					rs.getTimestamp("regdate"),
					rs.getTimestamp("moddate"),
					rs.getInt("read_cnt")
				);
	}
	

}
