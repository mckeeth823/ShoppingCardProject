/**
 * 
 */
package model;

/**
 * @author JoshuaBoudreau
 *
 */
public class Customer {
	
	private String fName;
	private String lName;
	private String address;
	private String city;
	private String state;
	private int zip;
	private String uName;
	private String password;
	
	
	// grabs information for customer logging in
	// creates information for new customer when registering
	public Customer(String fName, String lName, String address, String city,
			String state, int zip, String uName, String password) {
		this.fName = fName;
		this.lName = lName;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.uName = uName;
		this.password = password;	
	}

	/**
	 * @return the fName
	 */
	public String getfName() {
		return fName;
	}

	/**
	 * @param fName the fName to set
	 */
	public void setfName(String fName) {
		this.fName = fName;
	}

	/**
	 * @return the lName
	 */
	public String getlName() {
		return lName;
	}

	/**
	 * @param lName the lName to set
	 */
	public void setlName(String lName) {
		this.lName = lName;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the zip
	 */
	public int getZip() {
		return zip;
	}

	/**
	 * @param zip the zip to set
	 */
	public void setZip(int zip) {
		this.zip = zip;
	}

	/**
	 * @return the uName
	 */
	public String getuName() {
		return uName;
	}

	/**
	 * @param uName the uName to set
	 */
	public void setuName(String uName) {
		this.uName = uName;
	}

	/**
	 * @return the password
	 */
	public String getpassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setpassword(String password) {
		this.password = password;
	}
	
	
}
