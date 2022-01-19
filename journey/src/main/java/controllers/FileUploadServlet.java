package controllers;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.Part;

import controllers.action.DoModifyBlogAction;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
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
		//doGet(request, response);
		
		String json = request.getParameter("response");
		
		JSONObject jsonData = JSONObject.
		
		request.setCharacterEncoding("utf-8");
//		DoModifyBlogAction domodifyblog = new DoModifyBlogAction();
HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String countryName = request.getParameter("countryName");
		String range = request.getParameter("range");
		String content = request.getParameter("content");
		String images = request.getParameter("image1");
		
		
    	System.out.println("title : "+ title);
    	System.out.println("countryName : "+ countryName);
    	System.out.println("range : "+ range);
    	System.out.println("content : "+ content);
    	
    	Part part = (Part) request.getPart("image1");
    	System.out.println("partgetName"+part.getName());
	}

}
