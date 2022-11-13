package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Orders;
import com.entities.User;
import com.helper.FactoryProvider;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try{
			HttpSession session=request.getSession();
			int uid=(Integer) session.getAttribute("id");
			int amountpaid= Integer.parseInt(request.getParameter("total"));

			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phoneno=request.getParameter("phoneno");
			String from=request.getParameter("from");
			String to=request.getParameter("to");
			String address=request.getParameter("address");
			String mode=request.getParameter("PaymentMode");
			String events=request.getParameter("events");
			
			//SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
			LocalDate fdate=LocalDate.parse(from,DateTimeFormatter.ISO_DATE);
			LocalDate tdate=LocalDate.parse(to,DateTimeFormatter.ISO_DATE);
			
			java.sql.Date fromdate=java.sql.Date.valueOf(fdate);
			java.sql.Date todate=java.sql.Date.valueOf(tdate);
			//Date tdate=date.parse(to);
			
			//Date d=Date.from(fdate.atStartOfDay(ZoneId.systemDefault()).toInstant());
			//Date fromdate=fdate;
			//Date todate=tdate;
			
			out.println(uid+"|"+amountpaid+"|"+name+"|"+email+"|"+phoneno+"|"+address+"|"+events+"|"+mode+"|"+fromdate+"|"+todate);
			
			Orders odr=new Orders(uid,amountpaid,name,email,phoneno,address,events,mode,fromdate,todate);

			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(odr);
			
			if(session.getAttribute("order") == "cart")
			{
				String query = "delete from AddEvent where UserId =: id";
				Query q = s.createQuery(query);
				q.setParameter("id", uid);
				
				int result=q.executeUpdate();
				out.println("Rows Deleted="+result);
			}
			
			
			tx.commit();
			s.close();
			
			out.println("Success");
						
			RequestDispatcher dispatcher = request.getRequestDispatcher("orderconfirmation.jsp");
	        request.setAttribute("events",events);
	        request.setAttribute("name",name);
	        request.setAttribute("email",email);
	        request.setAttribute("phone",phoneno);
	        request.setAttribute("amountpaid",amountpaid);
	        request.setAttribute("mode",mode);
	        request.setAttribute("from",from);
	        request.setAttribute("to",to);
	        dispatcher.forward(request, response);
			
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
