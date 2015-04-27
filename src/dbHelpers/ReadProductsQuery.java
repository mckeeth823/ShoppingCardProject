/**
 * 
 */
package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Product;

/**
 * @author Conner McKeeth
 *
 */
public class ReadProductsQuery {
	private Connection connection;
	private ResultSet results;
	
	public ReadProductsQuery(String dbName, String uname, String pwd)
	{
		String url = "jdbc:mysql://localhost:3306/" + dbName;
		
		// set up the driver
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			this.connection = DriverManager.getConnection(url, uname, pwd);
		}
		catch (InstantiationException e)
		{
			e.printStackTrace();
		}
		catch (IllegalAccessException e)
		{
			e.printStackTrace();
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void doRead()
	{
		String query = "select * from product";
		
		try
		{
			PreparedStatement ps = this.connection.prepareStatement(query);
			this.results = ps.executeQuery();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public ArrayList<Product> getProducts()
	{
		ArrayList<Product> inventory = new ArrayList<Product>();
		try
		{
			while(this.results.next())
			{
				Product product = new Product();
				product.setId(this.results.getInt("id"));
				product.setName(this.results.getString("name"));
				product.setUrl(this.results.getString("url"));
				product.setPrice(this.results.getDouble("price"));
				product.setQuantity(this.results.getInt("quantity"));
				inventory.add(product);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return inventory;
	}
}
