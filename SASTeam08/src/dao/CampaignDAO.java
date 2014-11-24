package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import bean.DocBean;
import beanloader.DocsBeanLoader;
import dao.DAOFactory;
import database.DBUtil;

public class CampaignDAO {
	private DAOFactory factory;
	private DocsBeanLoader loader; 

	public CampaignDAO(DAOFactory factory) {
		this.factory = factory;
		this.loader = new DocsBeanLoader();
	}
	
	public List<DocBean> getDocs(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = factory.getConnection();
			ps = conn.prepareStatement("SELECT * FROM `docs` WHERE `campaignId` = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			List<DocBean> beans = loader.loadList(rs);
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
			ps = conn.prepareStatement("INSERT INTO `docs` ('href', `text`, 'campaignId') "
					+ "VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE `id` = `id`");
			loader.loadParameters(ps, bean);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Database Error...");
		} finally {
			DBUtil.closeConnection(conn, ps);
		}
	}
	
}
