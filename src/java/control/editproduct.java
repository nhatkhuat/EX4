/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.CartDAO;
import dal.DAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "editproduct", urlPatterns = {"/editproduct"})
public class editproduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        int pid = Integer.parseInt(request.getParameter("pid"));
        Product p = dao.getProductByProductID(pid);
        request.setAttribute("name", p.getName());
        request.setAttribute("color", p.getColor());
        request.setAttribute("purchase", p.getPurchase());
        request.setAttribute("price", p.getPrice());
        request.setAttribute("image", p.getImage());
        request.setAttribute("ram", p.getRam());
        request.setAttribute("rom", p.getMemory());
        request.setAttribute("available", p.getAvailable());
        request.setAttribute("description", p.getDescription());
        String catname = dao.getCategoryName(p.getCategoryID());
        request.setAttribute("category", catname);
        session.setAttribute("editpid", pid);
        List<Category> listC = dao.getAllCategory();
        session.setAttribute("listC", listC);
        request.getRequestDispatcher("editproduct.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    HttpSession session = request.getSession();
        DAO dao = new DAO();
        CartDAO cdao = new CartDAO();
        ProductDAO pdao = new ProductDAO();
        int pid = (int) session.getAttribute("editpid");
        String name = request.getParameter("name");
        String catname = request.getParameter("category");
        String rom = request.getParameter("rom");
        String ram = request.getParameter("ram");
        String color = request.getParameter("color");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        int purchase = Integer.parseInt(request.getParameter("purchase"));
        int price = Integer.parseInt(request.getParameter("price"));
        int available = Integer.parseInt(request.getParameter("available"));
        int catid = dao.getCategoryID(catname);
        Product p = new Product();
        p.setName(name);
        p.setColor(color);
        p.setRam(ram);
        p.setAvailable(available);
        p.setDescription(description);
        p.setCategoryID(catid);
        p.setMemory(rom);
        p.setPurchase(purchase);
        p.setPrice(price);
        p.setImage(image);
        p.setProductID(pid);
        pdao.editProduct(p);
        
        List<Product> listP = dao.getAllProduct();
        session.setAttribute("listP", listP);
        request.getRequestDispatcher("productlist.jsp").forward(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
