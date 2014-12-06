package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import bean.CampaignBean;
import bean.DocBean;
import bean.ImageCommentBean;
import beanloader.CampaignBeanLoader;
import beanloader.DocsBeanLoader;
import beanloader.ImageCommentBeanLoader;
import dao.DAOFactory;
import database.DBUtil;

public class CampaignDAO {
	private DAOFactory factory;
	private DocsBeanLoader docLoader;
	private CampaignBeanLoader campaignLoader; 
	private ImageCommentBeanLoader imageCommentLoader;

	public CampaignDAO(DAOFactory factory) {
		this.factory = factory;
		this.campaignLoader = new CampaignBeanLoader();
		this.docLoader = new DocsBeanLoader();
		this.imageCommentLoader = new ImageCommentBeanLoader();
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
	
	public void deleteDoc(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = factory.getConnection();
			ps = conn.prepareStatement("DELETE FROM docs WHERE id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Database error...");
		} finally {
			DBUtil.closeConnection(conn, ps);
		}
	}
	
	
	public void addComment(ImageCommentBean bean) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = factory.getConnection();
			ps = conn.prepareStatement("INSERT INTO `imageComments` ( docId, comment, usersName, xPos, yPos) "
					+ "VALUES( ?, ?, ?, ?, ?)");
			imageCommentLoader.loadParameters(ps, bean);
			System.out.println(ps.toString());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Database error...");
		} finally {
			DBUtil.closeConnection(conn, ps);
		}
	}
	
	public List<ImageCommentBean> getComments(int docId) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = factory.getConnection();
			ps = conn.prepareStatement("SELECT * FROM imageComments WHERE docId = ?"); 
			ps.setInt(1, docId);
			ResultSet rs = ps.executeQuery();
			List<ImageCommentBean> list = imageCommentLoader.loadList(rs);
			ps.close();
			return list; 
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			//System.out.println("Database error...");
		} finally {
			DBUtil.closeConnection(conn, ps);
		}
		return null;
	}
}
