package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import bean.CampaignBean;
import bean.DocBean;
import beanloader.CampaignBeanLoader;
import beanloader.DocsBeanLoader;
import dao.DAOFactory;
import database.DBUtil;

public class CampaignDAO {
	private DAOFactory factory;
	private DocsBeanLoader docLoader;
	private CampaignBeanLoader campaignLoader; 

	public CampaignDAO(DAOFactory factory) {
		this.factory = factory;
		this.campaignLoader = new CampaignBeanLoader();
		this.docLoader = new DocsBeanLoader();
	}
	
	public List<CampaignBean> getCampaigns() {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = factory.getConnection();
			ps = conn.prepareStatement("SELECT * FROM `campaigns`");
			ResultSet rs = ps.executeQuery();
			List<CampaignBean> beans = campaignLoader.loadList(rs);
			rs.close();
			ps.close();
			return beans;
		} catch (SQLException e) {
			System.out.println("Database Error...");
		} finally {
			DBUtil.closeConnection(conn, ps);
		}
		return null;
	}
	
	
	public List<DocBean> getDocs(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = factory.getConnection();
			ps = conn.prepareStatement("SELECT * FROM `docs` WHERE `campaignId` = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			List<DocBean> beans = docLoader.loadList(rs);
			rs.close();
			ps.close();
			return beans;
		} catch (SQLException e) {
			System.out.println("Database Error...");
		} finally {
			DBUtil.closeConnection(conn, ps);
		}
		return null;
	}
	
	public void insertDoc(DocBean bean) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = factory.getConnection();
			ps = conn.prepareStatement("INSERT INTO `docs` (href, text, campaignId, creator, ext) "
					+ "VALUES(?, ?, ?, ?, ?)");
			docLoader.loadParameters(ps, bean);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Database error...");
		} finally {
			DBUtil.closeConnection(conn, ps);
		}
	}
	
}
