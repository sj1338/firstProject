package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import article.dao.ArticleDao;
import article.model.Article;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class SearchService {
	private ArticleDao articleDao = new ArticleDao();
	private int size = 10;
	
	public ArticlePage getArticlePage(int pageNum, String search) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			
			int total = articleDao.selectCount(conn);  // int total = articleDao.selectCount(conn);
			
			List<Article> result = articleDao.search(conn, pageNum, size, search); // List<Article> content = articleDao.select(conn, pageNum, size, category);
			
			
			
			return new ArticlePage(total, pageNum, size, result);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
