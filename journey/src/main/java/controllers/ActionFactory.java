package controllers;

import controllers.action.Action;
import controllers.action.DeleteReReviewAction;
import controllers.action.DeleteReviewAction;
import controllers.action.DeleteUserAction;
import controllers.action.JoinAction;
import controllers.action.LoginAction;
import controllers.action.LogoutAction;
import controllers.action.ModifyReReviewAction;
import controllers.action.ModifyReviewAction;
import controllers.action.ModifyReviewSubmitAction;
import controllers.action.ModifyUserAction;
import controllers.action.WriteReReviewAction;
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
		
		else if(command.equals("modifyReview"))
			return new ModifyReviewAction();
		
		else if(command.equals("modifyReviewSubmit"))
			return new ModifyReviewSubmitAction();
		
		else if(command.equals("mypage"))
			return new ModifyUserAction();
		
		else if(command.equals("deleteUser"))
			return new DeleteUserAction();
		
		else if(command.equals("deleteReview"))
			return new DeleteReviewAction();
		
		else if(command.equals("deleteReReview"))
			return new DeleteReReviewAction();
		
		else if(command.equals("logout"))
			return new LogoutAction();
		
		else if(command.equals("writeReReview"))
			return new WriteReReviewAction();
		
		else if(command.equals("modifyReReview"))
			return new ModifyReReviewAction();
		
		
		return null;
	}
	
}
