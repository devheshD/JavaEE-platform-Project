package com.sist.controller;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
/*
 * 		JAXB (XML 태그, 클래스명 => 바인드)
 * 		JAXP (XML에서 필요한 데이터 읽어 들인다)
 * 			  데이터를 저장후 사용 : dom (수정, 삭제, 추가, 읽기)
 * 			  데이터를 읽기 전용 : sax => Mybatis, spring
 */
import java.util.*;
public class XMLParser extends DefaultHandler {
	
	public ArrayList<String> list = new ArrayList<String>();
	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		try {
			if(qName.equals("context:component-scan")) {
				String pack = attributes.getValue("package-base");
				list.add(pack);
			}
		} catch (Exception e) {}
		
	}
	
}
