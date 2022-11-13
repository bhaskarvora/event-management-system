package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.regex.*;  



public class filter1 implements Filter {

   
    public filter1() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		PrintWriter out=response.getWriter();

		String pass=request.getParameter("password");
		String email=request.getParameter("email");
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");


	    String regexPattern = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$";
		
		if(email.matches(regexPattern))
		{
	        if(pass.length()>=4) {
	        	
				chain.doFilter(request, response);
				
			}else {
		        request.setAttribute("message", "Invalid password length");
		        dispatcher.forward(request, response);
			}
	        
		}else {
	        request.setAttribute("message", "Invalid email");
	        dispatcher.forward(request, response);

		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}