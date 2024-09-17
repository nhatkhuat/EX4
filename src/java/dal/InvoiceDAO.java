/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.Customer;
import model.Product;

/**
 *
 * @author hihihihaha
 */
public class InvoiceDAO extends DBContext {

    public int NumberOfInvoice() {
        int number = 0;
        String sql = """
                     SELECT COUNT(num) AS Number
                     FROM (
                         SELECT InvoiceID AS num
                         FROM Cart
                         GROUP BY InvoiceID
                     ) AS subquery""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Number");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public int TotalOfInvoice() {
        int number = 0;
        String sql = """
                     SELECT Sum(total) AS Num
                     FROM Cart
                     where InvoiceID is not null""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public int TotalOfInvoiceByInvoiceID(int invoiceid) {
        int number = 0;
        String sql = """
                     SELECT Sum(total) AS Num
                     FROM Cart
                     where InvoiceID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, invoiceid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public int NumberOfCustomer() {
        int number = 0;
        String sql = """
                     select count(a) as Num from(
                     SELECT distinct cusID AS a
                     FROM Cart) as sub""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public List<Cart> getCartByInvoiceID(int invoiceID) {

        List<Cart> sList = new ArrayList<>();
        String sql = "select * from Cart c, Product p\n"
                + "where c.ProductID = p.ProductID\n"
                + "and InvoiceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, invoiceID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("CartID");
                String date = rs.getString("Date");
                int quantity = rs.getInt("Quantity");
                int price = rs.getInt("Price");
                int total = price * quantity;
                int CusID = rs.getInt("CusID");
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String img = rs.getString("Image");
                Cart s = new Cart(cartID, date, quantity, total, price, CusID, id, name, img, null);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }
    
    public List<Cart> getCartByMonth(int month) {

        List<Cart> sList = new ArrayList<>();
        String sql = "select * from Cart c, Product p\n"
                + "where c.ProductID = p.ProductID\n"
                + "and month(Date) = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, month);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("CartID");
                String date = rs.getString("Date");
                int quantity = rs.getInt("Quantity");
                int price = rs.getInt("Price");
                int total = price * quantity;
                int CusID = rs.getInt("CusID");
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String img = rs.getString("Image");
                Cart s = new Cart(cartID, date, quantity, total, price, CusID, id, name, img, null);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public Customer getCustomerByInvoiceID(int invoiceid) {
        Customer cus = new Customer();
        String sql = """
                     SELECT * FROM Customer cus, Cart ca
                     where cus.CusID = ca.CusID
                     and InvoiceID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, invoiceid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("CusID");
                String fullname = rs.getString("Fullname");
                String dob = rs.getString("Dob");
                int gender = rs.getInt("Gender");
                int CusID = rs.getInt("CusID");
                String pho = rs.getString("PhoneNumber");
                String email = rs.getString("Email");
                cus = new Customer(CusID, fullname, gender, dob, pho, email);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return cus;

    }

    public String getDateByInvoiceID(int invoiceid) {
        String date = "";
        String sql = """
                     SELECT * FROM Customer cus, Cart ca
                     where cus.CusID = ca.CusID
                     and InvoiceID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, invoiceid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                date = rs.getString("Date");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return date;

    }

}
