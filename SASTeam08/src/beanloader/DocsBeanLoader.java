package beanloader;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.DocBean;

public class DocsBeanLoader implements BeanLoader<DocBean> {

	@Override
	public List<DocBean> loadList(ResultSet rs) throws SQLException {
		List<DocBean> list = new ArrayList<DocBean>();
		while (rs.next()) {
			list.add(loadSingle(rs));
		}
		return list;
	}

	@Override
	public DocBean loadSingle(ResultSet rs) throws SQLException {
		DocBean bean = new DocBean();
		bean.setHref(rs.getString("href"));
		bean.setText(rs.getString("text"));
		bean.setCampaignId(rs.getInt("campaignId"));
		bean.setId(rs.getInt("id"));
		bean.setCreator(rs.getString("creator"));
		return bean;
	}

	@Override
	public PreparedStatement loadParameters(PreparedStatement ps, DocBean bean)
			throws SQLException {
		ps.setString(1, bean.getHref());
		ps.setString(2, bean.getText());
		ps.setInt(3, bean.getCampaignId());
		ps.setString(4, bean.getCreator());
		return ps;
	}

}
