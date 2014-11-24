package database;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBBuilder;
import dao.DAOFactory;
import database.TestDAOFactory;

public class TestDataGenerator {
	public static void main(String[] args) throws IOException, SQLException {
		TestDataGenerator gen = new TestDataGenerator();
		gen.clearAllTables();
		gen.standardData();
	}

	private String DIR = "sql/data";

	private DAOFactory factory;

	public TestDataGenerator() {
		this.factory = TestDAOFactory.getTestInstance();
	}

	public TestDataGenerator(String projectHome, DAOFactory factory) {
		this.DIR = projectHome + "/sql/data";
		this.factory = factory;
	}
	
	public void campaign1() throws FileNotFoundException, SQLException, IOException {
		new DBBuilder(factory).executeSQLFile(DIR + "/campaign1.sql");
	}
	
	public void standardData() throws FileNotFoundException, IOException, SQLException {
		campaign1();
	}
	
	public void clearAllTables() throws SQLException, FileNotFoundException, IOException {
		new DBBuilder(factory).executeSQLFile(DIR + "/deleteFromAllTables.sql");
	}
}