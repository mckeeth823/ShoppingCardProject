/**
 * 
 */
package model;

import java.util.ArrayList;

/**
 * @author Conner McKeeth
 *
 */
public class Cart {
	private ArrayList<Product> products;
	
	public Cart()
	{
		products = null;
	}
	
	public Cart(ArrayList<Product> products)
	{
		this.products = products;
	}
	
	public void setProducts(ArrayList<Product> products)
	{
		this.products = products;
	}
	
	public ArrayList<Product> getProducts()
	{
		return products;
	}
	
	public void addProduct(Product product)
	{
		this.products.add(product);
	}
	
	public double getTotal()
	{
		double total = 0.00;
		
		for(Product product : products)
		{
			total+=product.getTotal();
		}
		
		return total;
	}
}
