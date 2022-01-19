package utils;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import models.InfoDTO;

public class XmlParser {
	public static String getTagValue(String tag, Element eElement) {
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nList.item(0);

		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	public static InfoDTO getInfoData(String countryName) {
		
		InfoDTO dto = new InfoDTO();
		
		try {
			String servicekey = "%2FseR5iWiFnllO3Ktu0hnPhAI51qp65L3Ca8qyegoqPKNuPqND0Re9qFThbjHDEWNUiklXXrl3iZXGH6h0arYFQ%3D%3D";
			String url = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?servicekey="
					+ servicekey + "&countryName="+countryName;
			
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder  dBuilder = dbFactory.newDocumentBuilder();
			Document doc= dBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			System.out.println("root: "+doc.getDocumentElement().getNodeName());
			
			NodeList nList = doc.getElementsByTagName("item");
			
			for(int i=0; i<nList.getLength(); i++) {
				Node nNode = nList.item(i);
				
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					
					dto.setCountryName(getTagValue("countryName", eElement));
					dto.setBasic(getTagValue("basic", eElement));
					
					System.out.println("나라명: "+getTagValue("countryName", eElement));
					System.out.println("정보: "+getTagValue("basic", eElement));
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dto;
	}
	
}
