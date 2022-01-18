import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class parsingTest {
	private static String getTagValue(String tag, Element eElement) {
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nList.item(0);
		
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = new ArrayList<>();
		List<String> countries = new ArrayList<String>();
		
		int page = 1;
		try {
			while(true) {
			String servicekey="%2FseR5iWiFnllO3Ktu0hnPhAI51qp65L3Ca8qyegoqPKNuPqND0Re9qFThbjHDEWNUiklXXrl3iZXGH6h0arYFQ%3D%3D";
			String url = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?servicekey="+servicekey+"&numOfRows=10&pageNo="+page;
			
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			doc.getDocumentElement().normalize(); 
		//	System.out.println("Root element"+doc.getDocumentElement().getNodeName());
			
			NodeList nlList = doc.getElementsByTagName("items");
			
			for(int i = 0; i<nlList.getLength(); i++) {
				Node nNode =nlList.item(i);
				NodeList itemChild = nNode.getChildNodes();
			
				
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					System.out.println("국가명: "+getTagValue("countryName", eElement));
					System.out.println("기본정보: "+getTagValue("basic", eElement));
					
				}
				System.out.println();
			}
			page++;
			// System.out.println("pageNum:"+page);
			if(page>10) {
				break;
			}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
