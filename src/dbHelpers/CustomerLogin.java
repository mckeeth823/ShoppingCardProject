/**
 * 
 */
package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Customer;

/**
 * @author JoshuaBoudreau
 *
 */
public class CustomerLogin {
	
	private Connection connection;
	private PreparedStatement authenticateCustomerLogin;
	private ResultSet rs;
	private String uName;
	
	
	/**
	 * Constructor which makes a connection
	 */
	public CustomerLogin(String dbName, String uname, String pwd, String uName) {
		String url = "jdbc:mysql://localhost:3306/" + dbName;
		this.uName = uName;
		// Set up connection
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager.getConnection(url, uname, pwd);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public Customer authenticateCustomer() {
		Customer customer = null;
		String query = "select * from customer where uName=?";
		
		try {
			
			PreparedStatement ps = this.connection.prepareStatement(query);
		
			// Add parameters to the ?'s in the PreparedStatement and execute
			ps.setString(1,  this.uName);
			this.rs = ps.executeQuery();
		
			// If we have returned a row, turn that row into a new login user object
			if(rs.next()) {
				customer = new Customer(rs.getString("fName"), rs.getString("lName"),
						rs.getString("address"), rs.getString("city"), rs.getString("state"),
						rs.getInt("zipcode"), rs.getString("uName"), rs.getString("password"));
			} 
		} catch (SQLException e) {	
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return customer;
	}
}
