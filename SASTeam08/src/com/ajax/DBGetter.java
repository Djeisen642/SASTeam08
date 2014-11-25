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
import action.mainAction;

/**
 * Servlet implementation class DBGetter
 */
public class DBGetter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBGetter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		mainAction action = new mainAction();
		List<DocBean> list = action.getDocs(Integer.parseInt(id));
		JSONArray jsonArray = convertListToJSON(list);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String json = customPrinter(jsonArray);
		out.println(json);
	}

	private String customPrinter(JSONArray jsonArray) {
		String s = "[";
		for (int i = 0; i < jsonArray.length(); i++) {
			s += "{";
			JSONObject o = jsonArray.getJSONObject(i);
			s += "\"href\"" + ":\"" +  o.getString("href") + "\",";
			s += "\"text\":\"" + o.getString("text") + "\",";
			s += "\"campaignId\":\"" + o.getInt("campaignId") + "\",";
			s += "\"creator\":\"" + o.getString("creator") + "\",";
			s += "\"id\":\"" + o.getInt("id") + "\"";
			if (i != jsonArray.length() - 1) {
				s += "},";
			} else {
				s += "}";
			}
		}
		s += "]";
		return s;
	}

	private JSONArray convertListToJSON(List<DocBean> list) {
		JSONArray array = new JSONArray();
		for (int i = 0; i < list.size(); i++){
			JSONObject obj = new JSONObject();
			obj.put("href", list.get(i).getHref());
			obj.put("campaignId", list.get(i).getCampaignId());
			obj.put("text", list.get(i).getText());
			obj.put("id", list.get(i).getId());
			obj.put("creator", list.get(i).getCreator());
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
