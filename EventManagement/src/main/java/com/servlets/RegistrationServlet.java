package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;


public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try{
			
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phoneno=request.getParameter("phoneno");
			String password=request.getParameter("password");
			
			User user=new User(name,email,phoneno,password);
			
//			out.println("<h1>name="+name+"password="+password);
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(user);
			tx.commit();
			s.close();
			
//			out.println("<html><body><script type=\"text/javascript\">alert('Data added');</script></body></html>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	        request.setAttribute("success", "Registration Successfull");
	        dispatcher.forward(request, response);
			
		}catch(Exception e)
		{
			e.getMessage();
			out.println("Error");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
