package article.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.model.Article;
import article.service.IndexListService;
import mvc.command.CommandHandler;

public class IndexListHandler implements CommandHandler {
	
	private IndexListService indexService = new IndexListService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		Map<String, List<Article>> map = indexService.indexList();
		
		req.setAttribute("articleList", map);
		
		return "index";
	}
}
