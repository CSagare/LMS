package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DbConnection;
import model.Customer;

public class CustomerDAO {
DbConnection db = new DbConnection();

public int registerCustomerPreparedStatement(Customer customer) {
	try {
		String query = "insert into customer(custFname, custLname, gender,phoneNo," + 
	"address,username,password) values(?,?,?,?,?,?,?)";
		PreparedStatement st = db.con.prepareStatement(query);
		
		st.setString(1, customer.getCustFname());
		st.setString(2, customer.getCustLname());
		st.setString(3, String.valueOf(customer.getGender()));
		st.setString(4, customer.getPhoneNo());
		st.setString(5, customer.getAddress());
		st.setString(6, customer.getUsername());
		st.setString(7, customer.getPassword());
		return db.manipulate(st);
		
		
	}catch(SQLException e) {
		e.printStackTrace();
		return 0;
	}
}
 //login customer
public Customer loginCustomer (String username, String password) {
	String query;
	query= "select * from customer where username=' "+username +"' and password='" +password +"';";
	ResultSet rs = db.retrieve(query);
	Customer customer= null;
	
	try {
		while(rs.next()) {
			customer = new Customer();
			customer.setCustID(rs.getInt("custID"));
			customer.setCustFname(rs.getString("custFname"));
			customer.setCustLname(rs.getString("custLname"));
			customer.setGender(rs.getString("gender").charAt(0));
			customer.setAddress(rs.getString("address"));
			customer.setUsername(rs.getString("username"));
			}
	
	}catch(Exception ex) {
		System.out.println("Error"+ ex);
	}
	
	return customer;
	

}
public List<Customer> getAllCustomers() {
	String query;
	query = "select * from customer";
	db = new DbConnection();
	ResultSet rs = db.retrieve(query);
	List<Customer>lstCustomers = new ArrayList<Customer>();
	
	try {
		while(rs.next()) {
			Customer customer = new Customer();
			customer.setCustID(rs.getInt("custID"));
			customer.setCustFname(rs.getString("custFname"));
			customer.setCustLname(rs.getString("custLname"));
			customer.setGender(rs.getString("gender").charAt(0));
			customer.setAddress(rs.getString("address"));
			customer.setUsername(rs.getString("username"));
			
			lstCustomers.add(customer);
		}
	}catch(Exception ex) {
		System.out.print("Error" + ex);
	}
	return lstCustomers;
}
}