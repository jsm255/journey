package controllers;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controllers.action.Action;

/**
 * Servlet implementation class FileServlet
 */
@WebServlet("/writeBlog")
public class WriteBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteBlogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		HttpSession session = request.getSession();
		
		String path = request.getRealPath("blogImages");
		int maxSize = 5 * 1024 * 1024;
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			String fileName = multi.getFilesystemName("image");
			String originalName = multi.getOriginalFileName("image");
			String type = multi.getContentType("image");
			File file = multi.getFile("image");
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			
			
			System.out.println(fileName);
			System.out.println(originalName);
			System.out.println(type);
			System.out.println(file.length());
			System.out.println(path);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Complete!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
