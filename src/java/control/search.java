/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.Product;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet {

    static String text;
    static List<Product> staticList=new ArrayList<>();
    static String[] selectedPrices;
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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet search</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet search at " + request.getContextPath () + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            request.setCharacterEncoding("UTF-8");
            DAO dao = new DAO();
            int index = 1;
            String txt = request.getParameter("txt");
            String order = request.getParameter("order");
            String ram = request.getParameter("ram");
            String color = request.getParameter("color");
            String[] selectedPrices2 = request.getParameterValues("price");
            List priceCheck = new ArrayList();
            if(request.getParameterValues("price") != null){
                selectedPrices = request.getParameterValues("price");
            }
            List<Product> lprice = new ArrayList<>();
            
            if (selectedPrices2 != null) {
                for (Product p : dao.getAllProduct()) {
                    for (String price : selectedPrices2) {
                        priceCheck.add(price);
                        if ("36".equals(price)) {if (p.getPrice() >= 300 && p.getPrice() <= 600) {lprice.add(p);}
                        } else if ("68".equals(price)) {if (p.getPrice() >= 600 && p.getPrice() <= 800) {lprice.add(p);}
                        } else if ("810".equals(price)) {if (p.getPrice() >= 800 && p.getPrice() <= 1000) {lprice.add(p);}
                        } else if ("1012".equals(price)) {if (p.getPrice() >= 1000 && p.getPrice() <= 1200) {lprice.add(p);}
                        } else if ("1216".equals(price)) {if (p.getPrice() >= 1200 && p.getPrice() <= 1600) {lprice.add(p);}}
                    }
                }
            }
            List<Product> list = new ArrayList<>();
            if (txt != null && txt != text) {
                text = txt;
                list = dao.searchByName(text);
            }
            
            String catname = request.getParameter("cat");
            // catname == "Search" --> txt != null
            // catname != "Search" --> sap xep theo category, catname =="Samsung",.......
            if (catname != null && txt == null) {// tu category.jsp sang
                text = catname;list = dao.searchByName(text);
            } else if (catname == null && txt == null) {// tu search.jsp sang
                List<Product> currentList = staticList;
                if (currentList != null) {   list = currentList;  }
            }
            
            if (color != null) {  list = dao.searchByColor(color);}
            if (ram != null) {  list = dao.searchByRam(ram);}
            
            if (selectedPrices2 != null) {  list = lprice;}
            
            int Nopage = getNoPage(list);
            
            if (order != null && order.equals("low")) {f3(list);}
            else if (order != null && order.equals("high")) {f4(list);}
            else if (order != null && order.equals("name")) {f5(list);}
            if (request.getParameter("index") != null) {
                selectedPrices2 = (String[]) session.getAttribute("priceCheck");
                index = Integer.parseInt(request.getParameter("index"));
            }
            staticList = list;
            list = getListIndex(list, index);
            if(color == null && ram == null && txt == null){
                if(selectedPrices != null){
                    session.setAttribute("priceCheck", selectedPrices);
                }else{
                    session.setAttribute("priceCheck", selectedPrices2);
                }
            }
            if(color != null || ram != null || txt != null){
                session.removeAttribute("priceCheck");
            }
            
            session.setAttribute("Nopage", Nopage);
            request.setAttribute("currentindex", index);
            session.setAttribute("searchList", list);
            request.getRequestDispatcher("search.jsp").forward(request, response);
            
           
            
        } catch (Exception e) {
            out.println("Search servlet wrong");
        }
    }

    static public void f3(List<Product> t) {
        Collections.sort(t, (Product o1, Product o2) -> {
            return Integer.compare(o1.getPrice(), o2.getPrice());
        });
    }

    static public void f4(List<Product> t) {
        Collections.sort(t, (Product o1, Product o2) -> {
            return -Integer.compare(o1.getPrice(), o2.getPrice());
        });
    }

    static public void f5(List<Product> t) {
        Collections.sort(t, (Product o1, Product o2) -> {
            return o1.getName().compareTo(o2.getName());
        });
    }

    public int getNoPage(List<Product> list) {
        double page = (double) list.size() / 8;
        page = Math.ceil(page);
        return (int) page;
    }

    public static List<Product> getListIndex(List<Product> list, int index) {
        List<Product> l = new ArrayList<>();
        int size = list.size();
        int start = (8 * index) - 8;
        int end = Math.min((8 * index), size); // Ensure end does not go out of bounds
        for (int i = start; i < end; i++) {
            l.add(list.get(i));
        }
        return l;
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
        processRequest(request, response);
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
