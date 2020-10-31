package com.sist.controller;

import java.io.*;
import java.util.*;

public class FileScan {
	
	public static List<String> componentScan(String pack) {
		List<String> list = new ArrayList<String>();
		try {
			String path = "C:\\git\\Car_Project\\Project_car\\src\\";
			path = path + pack.replace(".", "\\");
			File dir = new File(path);
			File[] files = dir.listFiles();
			for (File f : files) {
				String name = f.getName();
				String ext = name.substring(name.lastIndexOf(".")+1);
				if (ext.equals("java")) {			
					String s = pack + "." + name.substring(0, name.lastIndexOf("."));

					list.add(s);
				}
			}
		} catch (Exception e) {}
		return list;
	}
}
