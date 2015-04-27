package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utilities.BCrypt;
import model.Cart;
import model.Customer;
import model.Product;
import dbHelpers.CustomerLogin;
import dbHelpers.ReadProductsQuery;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	private static int loginAttempts;
	private String url;
	public int maxLoginAttempts = 10;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		// get current session
		session = request.getSession();
		if(session.getAttribute("loginAttempts") == null)
		{
			loginAttempts = 0;
		}
		else
		{
			loginAttempts = (int) session.getAttribute("loginAttempts");
		}
		
		loginAttempts++;
		
		// handle exceeded login attempts
		if(loginAttempts > maxLoginAttempts){
			String errorMessage = "Number of login attempts has been exceded.";
			request.setAttribute("errorMessage", errorMessage);
		} else {
			// proceed by pulling fields from the login form
			String uName = request.getParameter("uName");
			String password = request.getParameter("password");
			
			// create a CustomerLogin object and authenticate login
			CustomerLogin cl = new CustomerLogin("netappsdb","root","password",uName);
			Customer customer = cl.authenticateCustomer();
			
			// is there a customer that matches the credentials?
			if(customer != null){
				boolean matched = BCrypt.checkpw(password, customer.getPassword());;
				if(!matched)
				{
					// Password incorrect
					String errorMessage = "Error: Password is incorrect<br>"
							+ "Login attempts remaining: " + (maxLoginAttempts-(loginAttempts));
					request.setAttribute("errorMessage", errorMessage);
					
					// track number of login attempts
					session.setAttribute("loginAttempts", loginAttempts);
					url = "index.jsp";
				}
				else
				{
					// retrieve Products and set them to session as inventory variable
					ReadProductsQuery rpq = new ReadProductsQuery("netappsdb", "root", "password");
					rpq.doRead();
					ArrayList<Product> inventory = rpq.getProducts();
					Cart cart;
					if(session.getAttribute("cart") == null)
					{
						cart = new Cart();
					}
					else
					{
						if(session.getAttribute("cart") instanceof Cart)
						{
							cart = (Cart)session.getAttribute("cart");
						}
						else
						{
							@SuppressWarnings("unchecked")
							ArrayList<Product> cartProducts = (ArrayList<Product>) session.getAttribute("cart");
							cart = new Cart(cartProducts);
						}
					}
					
					
					// invalidate current session, and get new session for customer 
					// to combat session hijacking
					session.invalidate();
					session = request.getSession(true);
					session.setAttribute("cart", cart);
					session.setAttribute("inventory", inventory);
					url = "products.jsp";
				}
			} else {
				// customer doesn't exist
				String errorMessage = "Error: Unrecognized username and/or password<br>"
						+ "Login attempts remaining: " + (maxLoginAttempts-(loginAttempts));
				request.setAttribute("errorMessage", errorMessage);
				
				// track number of login attempts
				session.setAttribute("loginAttempts", loginAttempts);
				url = "index.jsp";
			}
		}
		
		//forward the request
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	/**
	 * Logs the customer out of the account
	 */
	public void logout(){
		session.invalidate();
	}
}
