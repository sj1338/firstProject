package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticlePage;
import article.service.ListArticleService;
import mvc.command.CommandHandler;

public class ListArticleHandler implements CommandHandler {
	
	private ListArticleService listService = new ListArticleService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String category = req.getParameter("cat");
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		
		System.out.println("category" + category);
		
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		ArticlePage articlePage = listService.getArticlePage(pageNo, category);
		req.setAttribute("articlePage", articlePage);
		req.setAttribute("category", category);
		return "listArticle";
	}
}