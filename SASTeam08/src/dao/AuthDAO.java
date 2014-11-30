package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBUtil;
import dao.DAOFactory;
import database.DBException;
import database.SASException;

/**
 * AuthDAO is for anything that has to do with authentication. 
 * Most methods access the users table.
 * 
 * DAO stands for Database Access Object. 
 * All DAOs are intended to be reflections of the database, that is,
 * one DAO per table in the database (most of the time). 
 * For more complex sets of queries, extra DAOs are
 * added. DAOs can assume that all data has been validated and is correct.
 * 
 * DAOs should never have setters or any other parameter 
 * to the constructor than a factory. All DAOs should be
 * accessed by DAOFactory (@see {@link DAOFactory}) 
 * and every DAO should have a factory - for obtaining JDBC
 * connections and/or accessing other DAOs.
 */
@SuppressWarnings({})
public class AuthDAO {
	
	private transient final DAOFactory factory;

	/**
	 * The typical constructor.
	 * @param factory The {@link DAOFactory} associated with this DAO, 
	 * which is used for obtaining SQL connections, etc.
	 */
	public AuthDAO(final DAOFactory factory) {
		this.factory = factory;
	}

	/**
	 * Returns the name for a given username
	 * 
	 * @param username the username of the user
	 * @return A String representing the name of the user
	 * @throws SASException
	 * @throws DBException
	 */
	public String getName(final String username) throws SASException, DBException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement("SELECT firstName, lastName FROM users WHERE username=?");
			pstmt.setString(1, username);
			ResultSet results;

			results = pstmt.executeQuery();
			if (results.next()) {
				final String result = results.getString("firstName") + " " + results.getString("lastName"); 
				results.close();
				pstmt.close();
				return result;
			} else {
				throw new SASException("User does not exist");
			}
		} catch (SQLException e) {
			
			throw new DBException(e);
		} finally {
			DBUtil.closeConnection(conn, pstmt);
		}
	}

	/**
	 * Returns the link to the user's avatar
	 * 
	 * @param username the username of the user
	 * @return A String representing the link to the user's avatar
	 * @throws SASException
	 * @throws DBException
	 */
	public String getAvatar(final String username)  throws SASException, DBException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement("SELECT avatar FROM users WHERE username=?");
			pstmt.setString(1, username);
			ResultSet results;

			results = pstmt.executeQuery();
			if (results.next()) {
				final String result = results.getString("avatar"); 
				results.close();
				pstmt.close();
				return result;
			} else {
				throw new SASException("User does not exist");
			}
		} catch (SQLException e) {
			
			throw new DBException(e);
		} finally {
			DBUtil.closeConnection(conn, pstmt);
		}
	}
}
