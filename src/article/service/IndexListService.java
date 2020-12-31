package article.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import article.dao.ArticleDao;
import article.model.Article;
import jdbc.ConnectionProvider;

public class IndexListService {
	
	ArticleDao dao = new ArticleDao();

	public Map<String, List<Article>> indexList() {
		Map<String, List<Article>> map = new HashMap<String, List<Article>>();
		try (Connection conn = ConnectionProvider.getConnection();) {
			
			List<Article> artList = dao.selectNew4(conn, "art");
			map.put("art", artList);
			
			List<Article> cookList = dao.selectNew4(conn, "cook");
			map.put("cook", cookList);
			
			List<Article> gameList = dao.selectNew4(conn, "game");
			map.put("game", gameList);
			
			List<Article> musicList = dao.selectNew4(conn, "music");
			map.put("music", musicList);
			
			List<Article> sportList = dao.selectNew4(conn, "sport");
			map.put("sport", sportList);
			
			List<Article> tourList = dao.selectNew4(conn, "tour");
			map.put("tour", tourList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}

}
