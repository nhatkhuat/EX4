/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.AccountDAO;
import dal.CartDAO;
import dal.CustomerDAO;
import dal.DAO;
import dal.InvoiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Category;
import model.Customer;
import model.Product;

/**
 *
 * @author nhatk
 */
@WebServlet(name="dashboard", urlPatterns={"/dashboard"})
public class dashboard extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        CartDAO cdao = new CartDAO();
        CustomerDAO cusdao = new CustomerDAO();
        AccountDAO accdao = new AccountDAO();
        InvoiceDAO idao = new InvoiceDAO();
        PrintWriter out = response.getWriter();
        int NoCustomer = idao.NumberOfCustomer();//count
        request.setAttribute("NoCustomer", NoCustomer);
        int NoProduct = dao.NumberOfProduct();//count
        request.setAttribute("NoProduct", NoProduct);
        int NoInvoice = idao.NumberOfInvoice(); //count
        request.setAttribute("NoInvoice", NoInvoice);
        float expense = cdao.Expense();
        request.setAttribute("expense", expense);
        float revenue = cdao.Revenue();//sum
        request.setAttribute("revenue", revenue);
        float profit = revenue - expense;
        request.setAttribute("profit", profit);
        int month = 6;
        int NoCartByMonth  = cdao.NumberOfCartByMonth(month);
        request.setAttribute("NoCartByMonth", NoCartByMonth);
        int expenseMonth = cdao.ExpenseBYMonth(month);
        request.setAttribute("expenseMonth", expenseMonth);
        int revenueMonth = cdao.RevenueByMonth(month);
        request.setAttribute("revenueMonth", revenueMonth);
        int profitMonth = revenueMonth - expenseMonth;
        request.setAttribute("profitMonth", profitMonth);
        
        // danh gia khach hang
        Customer topcus = cusdao.TopCustomer();
        int TopcustomerCart = cdao.TotalOfCart(topcus.getCusID());
        session.setAttribute("toptotal", TopcustomerCart);
        session.setAttribute("topcus", topcus);
        
        List<Product> listP = dao.getAllProduct();
        session.setAttribute("listP", listP);
        List<Category> listC = dao.getAllCategory();
        session.setAttribute("listC", listC);
        List<Customer> listCus = cusdao.getAllCustomer();
        session.setAttribute("listCus", listCus);
        List<Account> listAcc = accdao.getAllAccount();
        session.setAttribute("listAcc", listAcc);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
