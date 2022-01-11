package controllers;

import controllers.action.Action;
import controllers.action.JoinAction;
import controllers.action.loginAction;
import controllers.action.writeReviewAction;


public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory () {}
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public static Action createAction(String command) {
		
		if(command.equals("join")) 
			return new JoinAction();
		else if(command.equals("writeReview"))
			return new writeReviewAction();
		
		else if(command.equals("login"))
			
			return new loginAction();
		return null;
	}
	
}
