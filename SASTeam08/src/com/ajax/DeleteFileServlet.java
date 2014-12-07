package com.ajax;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.mainAction;

/**
 * Servlet implementation class DeleteFileServlet
 */
public class DeleteFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private mainAction action;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFileServlet() {
        super();
        action = new mainAction();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String href = request.getParameter("href");
		
		//Get the absolute path from context
		ServletContext ctx = getServletContext();
		String contextPath = ctx.getRealPath("/");
	
		String new_href = href.replace("../", "");
		File f = new File(contextPath + "/" + new_href);
		if (f.exists()) {
			boolean deleted = f.delete();
		
		
		
			PrintWriter out = new PrintWriter(response.getWriter());
			if (deleted) {
				action.deleteDoc(id);
				out.write("File deleted!");
			} else {
				out.write("File deletion failed.");
			}
		}
		
		
	}

}
