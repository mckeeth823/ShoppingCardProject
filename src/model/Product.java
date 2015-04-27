/**
 * 
 */
package model;

/**
 * @author Conner McKeeth
 *
 */
public class Product {
	private int id;
	private String name;
	private String url;
	private double price;
	private int quantity;
	
	public Product()
	{
		id = 000001;
		name = "No Name";
		url = "/image.png";
		price = 0.00;
		quantity = 0;
	}
	
	public Product(int id, String name, String url, double price, int quantity)
	{
		this.id = id;
		this.name = name;
		this.url = url;
		this.price = price;
		this.quantity = 0;
	}
	
	public Product(Product p, int quantity)
	{
		this.id = p.getId();
		this.name = p.getName();
		this.url = p.getUrl();
		this.price = p.getPrice();
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public double getTotal()
	{
		return this.quantity * this.price;
	}
}
