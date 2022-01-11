package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.UserDAO;
import models.UserDTO;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		request.setCharacterEncoding("utf-8"); // 요청시 글자깨짐
		
		HttpSession session = request.getSession();
		
		UserDAO dao =  UserDAO.getInstance();
		
		String joinId = (String) request.getParameter("joinId");
		String joinPw = (String) request.getParameter("joinPw");
		String userName = (String) request.getParameter("userName");
		String tel = (String) request.getParameter("tel");
		
		UserDTO userdto = new UserDTO(joinId, joinPw,userName,tel);
		
		session.setAttribute("user", userdto);
		
		dao.insertUser(userdto);
		
		session.setAttribute("asdf", "qwer");
		
		System.out.println(userdto.toString());

		response.sendRedirect("login.jsp");
		
	} 

}
