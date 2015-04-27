/**
 * 
 */
package model;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author Conner McKeeth
 *
 */
public class Cart implements Iterable<Product>{
	private ArrayList<Product> products;
	
	public Cart()
	{
		ArrayList<Product> ps = new ArrayList<Product>();
		this.products = ps;
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
	
	public void removeProduct(int id)
	{
		for(int i = 0; i < this.products.size(); i++)	
		{
			if(this.products.get(i).getId() == id)
			{
				this.products.remove(i);
			}
		}
	}
	
	public Product getProduct(int id)
	{
		Product p = null;
		for(Product product : products)
		{
			if(product.getId() == id)
			{
				p = product;
			}
		}
		return p;
	}
	
	public int getSize()
	{
		int size = 0;
		for(Product product:products)
		{
			size+=product.getQuantity();
		}
		return size;
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

	@Override
	public Iterator<Product> iterator() {
		// TODO Auto-generated method stub
		return this.products.iterator();
	}
}
