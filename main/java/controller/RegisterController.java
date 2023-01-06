package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

import java.io.IOException;
import java.io.PrintWriter;

import dao.CustomerDAO;

/**
 * Servlet implementation class RegisterController
 */
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO customerdao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		customerdao = new CustomerDAO();
		PrintWriter out=response.getWriter();
		String custFname= request.getParameter("firstName");
		String custLname= request.getParameter("lastName");
		char gender= request.getParameter("gender").charAt(0);
		String phoneNo= request.getParameter("phoneNo");
		String address= request.getParameter("address");
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		
		Customer customer= new Customer(custFname,custLname,gender,phoneNo,address,username,password);
		try {
			int insert= customerdao.registerCustomerPreparedStatement(customer);
			if(insert==1) {
				out.print("Successfully added");
			}else {
				out.print("Error registring customer");
			}
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		

	}

}
