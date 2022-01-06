package controllers;

import controllers.action.Action;

public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory () {}
	public ActionFactory getInstance() {
		return instance;
	}
	
	public static Action createAction(String command) {
		
		return null;
	}
	
}
