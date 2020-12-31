package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleDao;
import article.model.Article;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class WriteArticleService {
	private ArticleDao articleDao = new ArticleDao();
	
	public Integer write(WriteRequest req) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = toArticle(req);
			
			System.out.println(article);
			Article savedArticle = articleDao.insert(conn, article);
			
			if (savedArticle == null) {
				throw new RuntimeException("fail to insert article");
			}
			
			conn.commit();
			
			return savedArticle.getNumber();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private Article toArticle(WriteRequest req) {
		return new Article(req.getCategory(), null, req.getWriter(), req.getTitle(), req.getContent(), null, null, 0);
	}
}






