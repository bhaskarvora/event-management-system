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
import com.entities.AddEvent;
import com.helper.FactoryProvider;

public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		try {

			HttpSession session = request.getSession();
			int uid = (Integer) session.getAttribute("id");
			
			int eventid = (Integer) session.getAttribute("eventid");
			String eventimg = (String) session.getAttribute("eventimg");
			String eventname = (String) session.getAttribute("eventname");
			String eventprice = (String) session.getAttribute("eventprice");

			out.println("id=" + uid + "\neventid=" + eventid + "\nimg=" + eventimg + "\nname=" + eventname + "\nprice="
					+eventprice);

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			AddEvent addcart=null;
			
			String query="from AddEvent where UserId=:uid and EventId=:eid";
			Query q =s.createQuery(query);
			q.setParameter("uid",uid);
			q.setParameter("eid",eventid);
			addcart=(AddEvent) q.uniqueResult();
			if (addcart != null )
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("eventdetails.jsp?id="+eventid);
				request.setAttribute("message", "Event already added to your cart");
				dispatcher.forward(request, response);
				 
	         }
			else
			{
				 addcart=new AddEvent(uid,eventid,eventname,eventimg,eventprice);
				 s.save(addcart);	
				 out.println("Success");
					 RequestDispatcher dispatcher = request.getRequestDispatcher("eventdetails.jsp?id="+eventid);
					 request.setAttribute("success", "Event added to your cart");
					 dispatcher.forward (request, response);
					
			}
			

			tx.commit();
			s.close();
			
			

		} catch (Exception e) {
			e.printStackTrace();
			out.println("Error");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
