package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;

public class DeleteFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteFromCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try{

			HttpSession session=request.getSession();
			int cartid= (Integer) session.getAttribute("cartid");
			
			out.println(cartid);
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			Query q = s.createQuery("delete AddEvent where Id = :cartid");
			q.setParameter("cartid",cartid);
			int result = q.executeUpdate();
			
			tx.commit();
			s.close();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
       		dispatcher.forward(request, response);			
		}catch(Exception e)
		{
			e.printStackTrace();
			out.println("error");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
