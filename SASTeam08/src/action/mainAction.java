package action;

import java.util.ArrayList;
import java.util.List;

import dao.CampaignDAO;
import dao.DAOFactory;
import bean.CampaignBean;
import bean.DocBean;

public class mainAction {
	private CampaignDAO dao; 
	
	public mainAction () {
		this.dao = new CampaignDAO(DAOFactory.getProductionInstance());
	}
	
	public List<CampaignBean> getCampaigns() {
		List<CampaignBean> list = new ArrayList<CampaignBean>();
		list = dao.getCampaigns();
		return list; 
	}
	
	public List<DocBean> getDocs (int id) {
		List<DocBean> list = new ArrayList<DocBean>();
		list = dao.getDocs(id);
		return list;
	}
	
	public void insertDoc (DocBean bean) {
		dao.insertDoc(bean);
	}
	
	public void deleteDoc(int id) {
		dao.deleteDoc(id);
	}
	
}
