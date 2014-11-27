package com.ajax;

import action.mainAction;
import bean.DocBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class FileUploadServlet
 */
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader; 
    private mainAction action;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File f = new File("uploads");
		fileFactory.setRepository(f);
		this.uploader = new ServletFileUpload(fileFactory);
		this.action = new mainAction();
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
		String creator = request.getParameter("creator");
		String text = request.getParameter("text");
		ServletContext ctx = getServletContext();
		String contextPath = ctx.getRealPath(File.separator);
		PrintWriter out = response.getWriter();
		try {
			Collection<Part> parts = request.getParts();
			for (Part part : parts) {
				System.out.println("FileName="+ getFileName(part));
				System.out.println("ContentType="+part.getContentType());
				System.out.println("Size in bytes="+part.getSize());
				String filename = getFileName(part);
				String name = getNameMinusExtension(filename);
				String ext = getExtension(filename);
				filename = name +  (new Date()).getTime() + ext;
				part.write(contextPath+ File.separator + "uploads" +File.separator+ filename);
				System.out.println("here");
				DocBean bean = new DocBean();
				bean.setCampaignId(id);
				bean.setCreator(creator);
				bean.setText(text);
				bean.setExt(ext);
				bean.setHref("uploads" + File.separator + filename);
				action.insertDoc(bean);
			}
		} catch (Exception e) {
			out.write("Exception in uploading file.");
		}
		
		System.out.println("...File uploaded");
		response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
		out.write("Success");
		out.close();
	}
	
	private String getNameMinusExtension(String filename) {
		String[] array  = filename.split("[.]");
		String ext = array[0];
		return ext; 
	}

	public static String getExtension(String filename) {
		String[] array  = filename.split("[.]");
		String ext = array[array.length - 1];
		return ext; 
	}
	
	public static String getFileName(Part filePart)
	{
	    String header = filePart.getHeader("content-disposition");
	    for(String headerPart : header.split(";"))
	    {
	        if(headerPart.trim().startsWith("filename"))
	        {
	            return headerPart.substring(headerPart.indexOf('=') + 1).trim()
	                             .replace("\"", "").replaceAll(" ", "");
	        }
	    }
	    return null;
	}
}

