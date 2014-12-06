package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ImageCommentBean;
import action.mainAction;

/**
 * Servlet implementation class AddComment
 */
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private mainAction action; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComment() {
        super();
        this.action = new mainAction();
        // TODO Auto-generated constructor stub
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
		int docId = Integer.parseInt(request.getParameter("id"));
		String usersName = request.getParameter("usersName");
		String comment = request.getParameter("comment");
		double xPos = Double.parseDouble(request.getParameter("xPos"));
		double yPos = Double.parseDouble(request.getParameter("yPos"));
		ImageCommentBean bean = new ImageCommentBean();
		bean.setComment(comment);
		bean.setDocId(docId);
		bean.setUsersName(usersName);
		bean.setxPos(xPos);
		bean.setyPos(yPos);
		action.addComment(bean);
		
		PrintWriter out = response.getWriter();
	}

}
