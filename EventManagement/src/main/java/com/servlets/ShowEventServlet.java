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

import com.entities.Event;
import com.entities.User;
import com.helper.FactoryProvider;

public class ShowEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try{
			
			HttpSession session=request.getSession();
			int id=(Integer) session.getAttribute("id");
			
//			out.println(email+password);
			
			Event event=null;
			
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
				
			String query="from Event where UserId not in(:id)";
			Query q =s.createQuery(query);
			q.setParameter("id",id);
			List<Event> list=q.list();
			for(Event equp:list) 
			{
				
				out.println("<div class=\"col-4\">\r\n"
						+ "				<a href=\"eventdetails.jsp\"><img\r\n"
						+ "					src="+equp.getEventimage()+"></a> <a\r\n"
						+ "					href=\"eventdetails.jsp\"><h4>"+equp.getEventName()+"</h4></a>\r\n"
						+ "				<div class=\"rating\">\r\n"
						+ "					<i class=\"fa fa-star\"></i> <i class=\"fa fa-star\"></i> <i\r\n"
						+ "						class=\"fa fa-star\"></i> <i class=\"fa fa-star\"></i> <i\r\n"
						+ "						class=\"fa fa-star-o\"></i>\r\n"
						+ "				</div>\r\n"
						+ "				<p>550₹</p>\r\n"
						+ "			</div>");
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
