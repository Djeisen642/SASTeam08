package beanloader;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CampaignBean;

public class CampaignBeanLoader implements BeanLoader<CampaignBean> {

	@Override
	public List<CampaignBean> loadList(ResultSet rs) throws SQLException {
		List<CampaignBean> list = new ArrayList<CampaignBean>();
		while (rs.next()) {
			list.add(loadSingle(rs));
		}
		return list;
	}

	@Override
	public CampaignBean loadSingle(ResultSet rs) throws SQLException {
		CampaignBean bean = new CampaignBean();
		bean.setTitle(rs.getString("title"));
		bean.setId(rs.getInt("id"));
		return bean;
	}

	@Override
	public PreparedStatement loadParameters(PreparedStatement ps,
			CampaignBean bean) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
}
