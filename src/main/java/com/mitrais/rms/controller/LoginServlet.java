package com.mitrais.rms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mitrais.rms.dao.UserDao;
import com.mitrais.rms.dao.impl.UserDaoImpl;

@WebServlet("/login")
public class LoginServlet extends AbstractController {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String path = getTemplatePath(request.getServletPath());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String baseUrl = request.getRequestURL().substring(0, request.getRequestURL().length() - request.getRequestURI().length()) + request.getContextPath();;
        
        //get input from jsp		
  		String us = request.getParameter("username");
  		String pw = request.getParameter("userpass");
      		
  		UserDao user = UserDaoImpl.getInstance();
  		boolean canLogin = user.validateLogin(us, pw);
      		
  		//Validate Login with input
  		if(canLogin)
  		{
  			//create session and store variables
  			HttpSession session = request.getSession();
  	        session.setAttribute("username", us);
  	        //load welcome page with session data
//  			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/users/list.jsp");		
//  			view.forward(request, response);
  			response.sendRedirect(baseUrl + "/");
  			
  		}
  		//if input is not stored in database print error message and reload page
  		else
  		{
//  			out.print("<p style=\"color:red\">Incorrect Username or Password!</p>");
  			request.setAttribute("errorMessage", "Incorrect Username or Password");
  			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");		
  			view.forward(request, response);
  		
  		}
      	
  		out.close();
    }
}
