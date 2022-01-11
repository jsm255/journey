package controllers.action;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface joinAction {
	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	String id = request.getParameter("id");
	
}
