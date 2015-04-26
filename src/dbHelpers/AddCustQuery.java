package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Customer;

/**
 * @author JoshuaBoudreau
 *
 */
public class AddCustQuery {

		public Connection connection;
	
		public AddCustQuery(String dbName, String uName, String pwd) {
	
			String url = "jdbc:mysql://localhost:3306/" + dbName;
		
			try {
			
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				this.connection = DriverManager.getConnection(url, uName, pwd);
			
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

		public void doAdd(Customer customer) {
			// set up a string to hold the query
			String query = "insert into customer (fName, lName, address, city, state, zipcode, uName, password) values (?, ?, ?, ?, ?, ?, ?, ?)";
			
			// create a prepared statement using our query string
			try {
						
				PreparedStatement ps = connection.prepareStatement(query);
						
				ps.setString(1, customer.getfName());
				ps.setString(2, customer.getlName());
				ps.setString(3, customer.getAddress());
				ps.setString(4, customer.getCity());
				ps.setString(5, customer.getState());
				ps.setInt(6, customer.getZip());
				ps.setString(7, customer.getuName());
				ps.setString(8, customer.getPassword());
						
				// execute the query
				ps.executeUpdate();
						
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
	}	
}