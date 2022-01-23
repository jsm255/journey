package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import models.BlogDTO;
import models.UserDTO;

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
//		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		HttpSession session = request.getSession();
		
		// 원래껄로 바꿔쓰고 다시 바꾸기
		//  "C:\\Users\\A\\git\\journey\\journey\\src\\main\\webapp\\blogImages";
		// ㅁㄴㅇㄹ
		// "C:\\Users\\chox6\\git\\journey\\journey\\src\\main\\webapp\\blogImages";
		String path = "C:\\Users\\A\\git\\journey\\journey\\src\\main\\webapp\\blogImages";
		// 포트폴리오 용이라 로컬에 저장해도 괜찮으나
		// 실제 서비스때에는 별도의 이미지서버에 저장을 해야한다는 것을 인지하고 있을 것.
		int maxSize = 20 * 1024 * 1024;
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			String fileName = multi.getFilesystemName("image");
			String originalName = multi.getOriginalFileName("image");
			String type = multi.getContentType("image");
			File file = multi.getFile("image");
			String url = "blogPage.jsp";
			Enumeration e = multi.getFileNames();
			
			ArrayList<String> images = new ArrayList<>();
			
			while(e.hasMoreElements()) {
				String str = (String)e.nextElement();
				System.out.println(str);
				if(multi.getFilesystemName(str) == null) continue;
				else images.add(multi.getFilesystemName(str));
			}

		HttpSession session = request.getSession();
		BlogDAO blogDao = BlogDAO.getInstance();
		UserDAO userDao = UserDAO.getInstance();
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
//		String content = request.getParameter("content");
		int score = Integer.parseInt(multi.getParameter("score"));
		String countryName = multi.getParameter("countryName");
		String id = ((BlogDTO)session.getAttribute("bSession")).getId();
		int blogCode = Integer.parseInt(multi.getParameter("blogCode"));
		
		BlogDTO blog = new BlogDTO(countryName, title, content, score, images, blogCode);
		blogDao.updateBlog(blog);   
		
		request.getRequestDispatcher(url).forward(request, response);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
}
