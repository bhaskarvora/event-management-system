package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try{
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
//			out.println(email+password);
			
			User user=null;
			
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
//			user = (User) s.createQuery("FROM user WHERE Email =:email").setParameter("Email", email).uniqueResult();
//			user=(User)s.get(User.class, email)
//			if (user != null && user.getPassword().equals(password))
//			{
//				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
//		        request.setAttribute("success", "Registration Successfull");
//		        dispatcher.forward(request, response);
//            }
//			else
//			{
//				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//		        request.setAttribute("success", "Registration Successfull");
//		        dispatcher.include (request, response);
//			}
				
			String query="from User where Email=:email and Password=:password";
			Query q =s.createQuery(query);
			q.setParameter("email",email);
			q.setParameter("password",password);
			user=(User) q.uniqueResult();
			if (user != null )
			{
					HttpSession session=request.getSession();
					session.setAttribute("id", user.getId());
					session.setAttribute("name", user.getName());
					RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
					request.setAttribute("success", "Login Successfull");
			        dispatcher.forward(request, response);
	         }
			else
			{
					RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			        request.setAttribute("message", "Invalid Login Credential");
			        dispatcher.forward(request, response);
			}
			tx.commit();
			s.close();

		}catch(Exception e)
		{
			e.printStackTrace();
			out.println("Error");
		}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
