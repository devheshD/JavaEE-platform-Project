package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class DispatcherServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   List<String> clsList = new ArrayList<String>();
   public void init(ServletConfig config) throws ServletException {
      String path = config.getInitParameter("xmlPath");
      HandlerMapping hm = new HandlerMapping(path);
      clsList = hm.clsList;
   }

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try {
         String cmd = request.getRequestURI();
         cmd = cmd.substring(request.getContextPath().length()+1);
      
         for (String clsName : clsList) {
            Class cls = Class.forName(clsName);
            Object obj = cls.newInstance();
            Method[] methods = cls.getDeclaredMethods();   
            for (Method m : methods) {
               RequestMapping rm = m.getAnnotation(RequestMapping.class);
               if (cmd.equals(rm.value())) {               
                  String jsp = "";
                  
                  if(rm.value().equals("car/car_detail.do")||rm.value().equals("acc/accDetail.do"))
                  {
                     jsp=(String) m.invoke(obj, request,response);
                  }                                 
                  else 
                  {
                          jsp=(String) m.invoke(obj, request);
                  }
                  if (jsp.startsWith("redirect")) {
                     jsp = jsp.substring(jsp.indexOf(":") + 1);
                     response.sendRedirect(jsp);
                  } else {
                     RequestDispatcher rd = request.getRequestDispatcher(jsp);
                     rd.forward(request, response);
                  }
                  return;
               }
            }
            
            
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

}