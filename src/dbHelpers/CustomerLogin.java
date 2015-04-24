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
	
	
	/**
	 * Constructor which makes a connection
	 */
	public CustomerLogin() {
		
		// Set up connection
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager.getConnection(
					"jdbc:mysql://localhost/shopping", "root", "");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public Customer authenticateCustomer(String uName, String password) {
		Customer customer = null;
		
		String query = "select * from customer where username=? and password=?";
		
		try {
			
			this.authenticateCustomerLogin = this.connection.prepareStatement(query);
		
			// Add parameters to the ?'s in the PreparedStatement and execute
			this.authenticateCustomerLogin.setString(1,  uName);
			this.authenticateCustomerLogin.setString(2, password);
			this.rs = this.authenticateCustomerLogin.executeQuery();
		
			// If we have returned a row, turn that row into a new login user object
			if(rs.next()) {
				customer = new Customer( rs.getString("fName"), rs.getString("lName"),
						rs.getString("address"), rs.getString("city"), rs.getString("state"),
						rs.getInt("zip"), rs.getString("uName"), rs.getString("password"));
			} 
		} catch (SQLException e) {	
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return customer;
	}
}
