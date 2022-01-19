package controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import models.InfoDTO;

public interface Country {
	public void getInfoData(HttpServletRequest request);
	public List<InfoDTO> infoData(HttpServletRequest request);
}
