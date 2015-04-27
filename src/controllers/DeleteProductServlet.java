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

import model.Cart;
import model.Product;
import dbHelpers.UpdateQuantityQuery;

/**
 * Servlet implementation class RemoveProductServlet
 */
@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String errorMessage = "";
		String url = "cart.jsp";
		Cart cartObject = null;
		
		if(session.getAttribute("cart") instanceof Cart)
		{
			cartObject = (Cart)session.getAttribute("cart");
		}
		else
		{
			@SuppressWarnings("unchecked")
			ArrayList<Product> cartProducts = (ArrayList<Product>) session.getAttribute("cart");
			cartObject = new Cart(cartProducts);
		}
		
		@SuppressWarnings("unchecked")
		ArrayList<Product> inventory = (ArrayList<Product>)session.getAttribute("inventory");
		int id = Integer.parseInt(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int index = -1;
		int oldQty = 0;

		Product inventoryP = null;
		
		//finds matching product in inventory the list
		for(int i = 0; i <= inventory.size() - 1; i++)
		{
			if(inventory.get(i).getId() == id)
			{
				inventoryP = inventory.get(i);
				oldQty = inventoryP.getQuantity();
				index = i;
			}
		}
		
		// Testing if product id matches inventory
		if(inventoryP != null)
		{
			//updates product quantity
			int newQty = oldQty + quantity;
			inventoryP.setQuantity(newQty);
			
			// create an UpdateQuantityQuery object and use it to update product qty in database
			UpdateQuantityQuery uq = new UpdateQuantityQuery("netappsdb", "root", "password");
			uq.doUpdate(newQty, index+1);
			
			cartObject.removeProduct(id);
			request.setAttribute("total", cartObject.getTotal());
			
			ArrayList<Product> cart = cartObject.getProducts();
			
			session.setAttribute("cart", cart);
			session.setAttribute("inventory", inventory);
			
							
		}
		else
		{
			errorMessage = "There was an error removing the product";
			request.setAttribute("errorMessage",errorMessage);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	}

}
