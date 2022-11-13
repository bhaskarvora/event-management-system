package com.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Event;
import com.entities.User;
import com.helper.FactoryProvider;

@MultipartConfig(maxFileSize = 16177215)
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try{
			
			String name=request.getParameter("name");
			String price=request.getParameter("rentprice");
			String description=request.getParameter("description");
//			String image=request.getParameter("image");
			
			Part part=request.getPart("image");
		//	String imageFileName=part.getSubmittedFileName();
			
		
			
			//out.println("Image name="+imageFileName);
			
			HttpSession session=request.getSession();
			int userid= (Integer) session.getAttribute("id");
			
			InputStream is=null;
			if(part != null)
			{
				is=part.getInputStream();	
			}
			else
			{
				out.println("null");
			}
			byte[] data=new byte[is.available()];
			is.read(data);

			Event event=new Event(userid,name,price,description,data);
			
//			out.println("<h1>image="+image+"<br>user id="+id);
//			
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(event);
			tx.commit();
			s.close();
			
//			out.println("success");
//			out.println("<html><body><script type=\"text/javascript\">alert('Data added');</script></body></html>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	        request.setAttribute("success", "Event Added Successfully");
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
