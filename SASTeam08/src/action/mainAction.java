package action;

import java.util.ArrayList;
import java.util.List;

import dao.CampaignDAO;
import dao.DAOFactory;
import bean.DocBean;

public class mainAction {
	private CampaignDAO dao; 
	
	public mainAction () {
		this.dao = new CampaignDAO(DAOFactory.getProductionInstance());
	}
	
	public List<DocBean> getDocs (int id) {
		List<DocBean> list = new ArrayList<DocBean>();
		list = dao.getDocs(id);
		return list;
	}
	
	public void insertDoc (DocBean bean) {
		dao.insertDoc(bean);
	}
	
}
