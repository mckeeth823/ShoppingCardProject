/**
 * 
 */
package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import models.Product;

/**
 * @author Conner McKeeth
 * 
 */
public class UpdateQuery {
	private Connection connection;
	
	public UpdateQuery(String dbName, String uname, String pwd)
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
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doUpdate(Product product)
	{
		String query = "update products set quantity=? where id=?"; // TODO: Ensure columns are named quantity and id in database
		
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, product.getType());
			ps.setString(2, product.getFlavor());
			ps.setDouble(3, product.getCost());
			ps.setDouble(4, product.getPrice());
			ps.setInt(5, product.getQuantity());
			ps.setString(6, product.getSku());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
