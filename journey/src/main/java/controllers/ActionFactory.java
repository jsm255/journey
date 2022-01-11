package controllers;

import controllers.action.Action;
import controllers.action.JoinAction;
import controllers.action.LoginAction;
import controllers.action.WriteReviewAction;


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
			return new WriteReviewAction();
		
		else if(command.equals("login"))
			
			return new LoginAction();
		return null;
	}
	
}
