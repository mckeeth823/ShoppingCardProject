/**
 * 
 */
package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Product;

/**
 * @author Conner McKeeth
 * 
 */
public class UpdateQuantityQuery {
	private Connection connection;
	
	public UpdateQuantityQuery(String dbName, String uname, String pwd)
	{
		String url = "jdbc:mysql://localhost:3306/" + dbName;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			this.connection = DriverManager.getConnection(url, uname, pwd);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doUpdate(int quantity, int id)
	{
		String query = "update product set quantity=? where id=?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setInt(1, quantity);
			ps.setInt(2, id);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
