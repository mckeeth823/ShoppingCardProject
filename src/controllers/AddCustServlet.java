package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utilities.BCrypt;
import dbHelpers.AddCustQuery;
import model.Customer;

/**
 * Servlet implementation class AddCustomerServlet
 */
@WebServlet("/register")
public class AddCustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get information from registrationForm.jsp and create Customer object
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		int zip = Integer.parseInt(request.getParameter("zip"));
		String uName = request.getParameter("uName");
		String password = request.getParameter("password");
		
		password = BCrypt.hashpw(password,BCrypt.gensalt(12));
		
		Customer customer = new Customer(fName, lName, address, city, 
				state, zip, uName, password);
		
		// create an AddCustomerQuery object and use it to add the customer
		AddCustQuery acq = new AddCustQuery("netappsdb", "root", "password");
		acq.doAdd(customer);
		
		// pass control to the customerAccount
		String url = "/products.jsp";
				
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}