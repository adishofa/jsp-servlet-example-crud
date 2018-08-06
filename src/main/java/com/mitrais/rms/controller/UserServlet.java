package com.mitrais.rms.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mitrais.rms.dao.UserDao;
import com.mitrais.rms.dao.impl.UserDaoImpl;
import com.mitrais.rms.model.User;

@WebServlet("/users/*")
public class UserServlet extends AbstractController {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String path = getTemplatePath(req.getServletPath()+req.getPathInfo());
        
        try {
        	switch (req.getPathInfo()) {
        	case "/delete":
        		deleteUser(req, resp);
        		break;
        	case "/add":
        		showNewForm(req, resp);
        		break;
        	case "/edit":
        		showEditForm(req, resp);
        		break;
        	case "/insert":
        		insertUser(req, resp);
        		break;
        	case "/update":
        		updateUser(req, resp);
        		break;
        	default:
        		listUser(req, resp);
        		break;
        	}
        	
        } catch (SQLException ex) {
        	throw new ServletException(ex);
        }
        
    }
	
	private void listUser(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException, ServletException {
		List<User> users = UserDaoImpl.getInstance().findAll();
		req.setAttribute("users", users);
		RequestDispatcher rD = req.getRequestDispatcher("/WEB-INF/jsp/users/list.jsp");
		rD.forward(req, res);
	}
	private void showNewForm(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException, ServletException {
		
		RequestDispatcher rD = req.getRequestDispatcher("/WEB-INF/jsp/users/new-form.jsp");
		rD.forward(req, res);
	}
	private void showEditForm(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException, ServletException {
		Long id = Long.parseLong(req.getParameter("id"));
		User existUser = UserDaoImpl.getInstance().find(id); 
		
		RequestDispatcher rD = req.getRequestDispatcher("/WEB-INF/jsp/users/edit-form.jsp");
		req.setAttribute("user", existUser);
		
		rD.forward(req, res);
	}
	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String user = request.getParameter("username");
        String pass = request.getParameter("userpass");
        
        UserDao addUser = UserDaoImpl.getInstance();
  		boolean canInsert = addUser.save(user, pass);       
        if(canInsert) {
  			HttpSession session = request.getSession();
  	        session.setAttribute("username", user);
  	        response.sendRedirect("list");
  			
  		} else {
  			request.setAttribute("errorMessage", "Incorrect Username or Password");
  			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/users/new-form.jsp");		
  			view.forward(request, response);  		
  		}
    }
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        Long id = Long.parseLong(request.getParameter("id"));
		String user = request.getParameter("username");
        String pass = request.getParameter("userpass");
        
        User userUpdate = new User(id, user, pass);
        
        UserDao addUser = UserDaoImpl.getInstance();
  		boolean canUpdate = addUser.update(userUpdate);       
        if(canUpdate) {
        	HttpSession session = request.getSession();
  	        session.setAttribute("username", user);
  	        response.sendRedirect("list");
  		} else {
  			request.setAttribute("errorMessage", "Error update user");
  			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/users/edit-form.jsp");		
  			view.forward(request, response);  		
  		}
    }
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        Long id = Long.parseLong(request.getParameter("id"));
        
        UserDao delUser = UserDaoImpl.getInstance();
  		boolean canDelete = delUser.delete(id);       
        if(canDelete) {
  	        response.sendRedirect("list");
  		} else {
  			request.setAttribute("errorMessage", "Error on delete, please try again letter");
  			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/users/list.jsp");		
  			view.forward(request, response);  		
  		}
    }
	
}
