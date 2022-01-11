package controllers;

import controllers.action.Action;
import controllers.action.joinAction;

public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory () {}
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public static Action createAction(String command) {
		
		if(command.equals("join")) 
			return new joinAction();
		
		return null;
	}
	
}
