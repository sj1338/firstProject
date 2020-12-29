package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class MyPageHandler implements CommandHandler {
	private static final String FORM_VIEW = "myPageForm";
//	private MyPageService myPageSvc = new MyPageService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}

}
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
//		User user = (User) req.getSession().getAttribute("authUser");
//		req.getSession().setAttribute("authUser", user);
		return FORM_VIEW;
	}
}