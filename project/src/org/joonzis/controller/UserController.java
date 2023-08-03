package org.joonzis.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joonzis.service.UserService;
import org.joonzis.service.UserServiceImpl;
import org.joonzis.vo.UVO;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String cmd = request.getParameter("cmd");
		String resultCmd = "allList";
		if(cmd != null && !cmd.isEmpty()) {
			resultCmd = cmd;
		}
		
		boolean forwardCheck = false;
		String path = "";
		
		UserService uservice = new UserServiceImpl();
		
		String currentPage = "";
		String open = null;
		HttpSession session = request.getSession();
		UVO uvo = null;
		int result;
		
		switch(resultCmd) {
			case "joinPage" :
				path = "user/joinPage.jsp";
				break;
			
			case "join" :
				uvo = new UVO();
				uvo.setId(request.getParameter("id"));
				uvo.setPw(request.getParameter("pw"));
				uvo.setName(request.getParameter("name"));
				uvo.setNickname(request.getParameter("nickname"));
				uvo.setBirth_d(request.getParameter("birth_d"));
				uvo.setPhone(request.getParameter("phone"));
				uvo.setAddr1(request.getParameter("addr1"));
				uvo.setAddr2(request.getParameter("addr2"));
				uvo.setAddr3(request.getParameter("addr3"));
				
				result = uservice.goJoin(uvo);
				request.setAttribute("result", result);
				forwardCheck=true;
				path = "user/join.jsp";
				break;
				
			case "loginPage":
				path = "user/loginPage.jsp";
				break;
				
			case "login" :
				uvo = new UVO();
				uvo.setId(request.getParameter("id"));
				uvo.setPw(request.getParameter("pw"));
				
				// 해당 계정이 존재하는지 확인 (count 값 리턴)
				result = uservice.ckMember(uvo);
				request.setAttribute("result", result);
				if(result > 0) {	// 해당 계정이 있을 때에만 계정 가져와서 session에 저장
					session.setAttribute("user", uservice.getMember(uvo));
				}
				
				forwardCheck=true;
				path = "user/login.jsp";
				break;
				
			case "logout":
				session.removeAttribute("user");
				path = "index.jsp";
				break;
				
			case "myPage" :
				String id = request.getParameter("id"); 
				session.setAttribute("user", uservice.getUser(id));
				uvo = uservice.getUser(id);
				  
				session.setAttribute("uvo", uvo);
				
				forwardCheck = true; 
				path = "user/myPage.jsp"; 
				break;
				
			case "update_info_page" :
				path = "user/update_page.jsp";
				break;
				
			case "update_info" : 
				uvo = new UVO();
				uvo.setId(request.getParameter("id"));
				uvo.setPw(request.getParameter("pw"));
				uvo.setPhone(request.getParameter("phone"));
				uvo.setAddr1(request.getParameter("addr1"));
				uvo.setAddr2(request.getParameter("addr2"));
				uvo.setAddr3(request.getParameter("addr3"));
				
				uservice.updateInfo(uvo);
				request.setAttribute("id", uvo.getId());
				forwardCheck=true;
				path = "user/update.jsp";
				break;
				
			case "soldHis" :
				path = "user/sold.jsp";
				break;
				
			case "buyHis" :
				path = "user/buy.jsp";
				break;
				
		}
		
		if(forwardCheck) {
			request.getRequestDispatcher(path).forward(request, response);
		}else {
			response.sendRedirect(path);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
