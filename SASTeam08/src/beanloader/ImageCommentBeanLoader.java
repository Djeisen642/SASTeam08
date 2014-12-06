package beanloader;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ImageCommentBean;

public class ImageCommentBeanLoader implements BeanLoader<ImageCommentBean>{

	@Override
	public List<ImageCommentBean> loadList(ResultSet rs) throws SQLException {
		List<ImageCommentBean> list = new ArrayList<ImageCommentBean>();
		while (rs.next()) {
			list.add(loadSingle(rs));
		}
		return list;
	}

	@Override
	public ImageCommentBean loadSingle(ResultSet rs) throws SQLException {
		ImageCommentBean bean = new ImageCommentBean();
		bean.setComment(rs.getString("comment"));
		bean.setDocId(rs.getInt("docId"));
		bean.setId(rs.getInt("id"));
		bean.setUsersName(rs.getString("usersName"));
		bean.setxPos(rs.getDouble("xPos"));
		bean.setyPos(rs.getDouble("yPos"));
		return bean;
	}

	@Override
	public PreparedStatement loadParameters(PreparedStatement ps,
			ImageCommentBean bean) throws SQLException {
		ps.setInt(1, bean.getDocId());
		ps.setString(2, bean.getComment());
		ps.setString(3, bean.getUsersName());
		ps.setDouble(4, bean.getxPos());
		ps.setDouble(5, bean.getyPos());
		return ps;
	}

}
