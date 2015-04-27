package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbHelpers.UpdateQuantityQuery;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class AddProductServlet
 * @author Thatcher Smith
 */
@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
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
		
		HttpSession session = request.getSession();
		String errorMessage = null;
		String url = "products.jsp";
		
		Cart cart = null;
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
		
		@SuppressWarnings("unchecked")
		ArrayList<Product> inventory = (ArrayList<Product>)session.getAttribute("inventory");
		int id = Integer.parseInt(request.getParameter("id"));
		
		if(request.getParameter("quantity") == null)
		{
			errorMessage = "Quantity was not received. Try again";
		}
		else
		{

			int qty = Integer.parseInt(request.getParameter("quantity"));
			int index = -1;
			int oldQty = 0;
			Product p = null;
			Product inventoryP = null;
			
			
			
			//finds matching product in inventory the list
			for(int i = 0; i <= inventory.size() - 1; i++)
			{
				if(inventory.get(i).getId() == id)
				{
					p = inventory.get(i);
					oldQty = p.getQuantity();
					index = i;
				}
			}
			if(qty <= 0)
			{
				errorMessage = "Quantity entered must be a positive number";
				request.setAttribute("errorMessage",errorMessage);
			}
			else if(oldQty < qty)
			{
				errorMessage = "The quantity you entered is larger than the current stock";
				request.setAttribute("errorMessage",errorMessage);
			}
			else
			{
				// Testing if product id matches inventory
				if(p != null)
				{
					//updates product quantity
					int newQty = oldQty - qty;
					p.setQuantity(newQty);
					
					// create an UpdateQuantityQuery object and use it to update product qty in database
					UpdateQuantityQuery uq = new UpdateQuantityQuery("netappsdb", "root", "password");
					uq.doUpdate(newQty, index+1);
					
					if(cart.getProduct(id)!=null)
					{
						cart.getProduct(id).setQuantity(cart.getProduct(id).getQuantity() + qty);
					}
					else
					{
						inventoryP = new Product(p,qty);
						cart.addProduct(inventoryP);
					}
					
					session.setAttribute("cart", cart);
					session.setAttribute("inventory", inventory);
									
				}
				else
				{
					errorMessage = "There was an error adding the product";
					request.setAttribute("errorMessage",errorMessage);
				}
			}
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	}

}
