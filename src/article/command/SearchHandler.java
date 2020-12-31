package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticlePage;
import article.service.SearchService;
import mvc.command.CommandHandler;

public class SearchHandler implements CommandHandler {
	private SearchService searchService = new SearchService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String search = req.getParameter("search");
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}

		ArticlePage articlePage = searchService.getArticlePage(pageNo, search);
		req.setAttribute("articlePage", articlePage);
		return "searchList";
	}

}