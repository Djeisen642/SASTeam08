package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import bean.DocBean;
import bean.ImageCommentBean;
import action.mainAction;

/**
 * Servlet implementation class GetImageComments
 */
public class GetImageComments extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private mainAction action;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetImageComments() {
        super();
        this.action = new mainAction();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int docId = Integer.parseInt(request.getParameter("docId"));
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		
		List<ImageCommentBean> list = action.getComments(docId);
		JSONArray array = convertListToJSON(list);
		String json = customPrinter(array);
		out.print(json);
	}
	
	private String customPrinter(JSONArray jsonArray) {
		String s = "[";
		for (int i = 0; i < jsonArray.length(); i++) {
			s += "{";
			JSONObject o = jsonArray.getJSONObject(i);
			s += "\"id\"" + ":\"" +  o.getInt("id") + "\",";
			s += "\"comment\":\"" + o.getString("comment") + "\",";
			s += "\"usersName\":\"" + o.getString("usersName") + "\",";
			s += "\"xPos\":\"" + o.getInt("xPos") + "\",";
			s += "\"yPos\":\"" + o.getInt("yPos") + "\",";
			s += "\"docId\":\"" + o.getInt("docId") + "\"";
			if (i != jsonArray.length() - 1) {
				s += "},";
			} else {
				s += "}";
			}
		}
		s += "]";
		return s;
	}

	private JSONArray convertListToJSON(List<ImageCommentBean> list) {
		JSONArray array = new JSONArray();
		for (int i = 0; i < list.size(); i++){
			JSONObject obj = new JSONObject();
			obj.put("id", list.get(i).getId());
			obj.put("comment", list.get(i).getComment());
			obj.put("usersName", list.get(i).getUsersName());
			obj.put("xPos", list.get(i).getxPos());
			obj.put("yPos", list.get(i).getyPos());
			obj.put("docId", list.get(i).getDocId());
			array.put(obj);
		}
		return array;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
