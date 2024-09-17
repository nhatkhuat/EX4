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
public class ProductDAO extends DBContext {

    

    public void addProduct(Product p) {
        String sql = """
                     insert into Product([Name],[Color],[Ram],[Memory],[Purchase],
                     [Price],[Image],[Description],[CategoryID],[Available])
                     values(?,?,?,?,?,?,?,?,?,?)""";
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, p.getName());
            st.setString(2, p.getColor());
            st.setString(3, p.getRam());
            st.setString(4, p.getMemory());
            st.setInt(5, p.getPurchase());
            st.setInt(6, p.getPrice());
            st.setString(7, p.getImage());
            st.setString(8, p.getDescription());
            st.setInt(9, p.getCategoryID());
            st.setInt(10, p.getAvailable());
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    
    public void deleteProduct(int pid) {
        String sql = """
                     delete from Product
                     where ProductID = ? """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    public static void main(String[] args) {
        DAO dao = new DAO();
        ProductDAO pdao = new ProductDAO();
        String name = "iPhone";
        String rom = "64GB";
        String ram ="4GB";
        String color = "White";
        String image = "assets/images/product/iphone11.jpg";
        String description = "The iPhone 11 features a 6.1-inch display, A13 Bionic chip, and dual-camera system.";
        int purchase = 499;
        int price = 699;
        int available = 100;
        int catid = 1;
        Product p = new Product();
        p.setProductID(catid);
        p.setName(name);
        p.setColor(color);
        p.setRam(ram);
        p.setMemory(rom);
        p.setAvailable(available);
        p.setDescription(description);
        p.setCategoryID(catid);
        p.setPurchase(purchase);
        p.setPrice(price);
        p.setImage(image);
        pdao.editProduct(p);
    }
    public void editProduct(Product p) {
        String sql = """
                     Update Product 
                       set [Name] = ?,
                       [Color] = ?,
                       [Ram] = ?,
                       [Memory] = ?,
                       [Purchase] = ?,
                       [Price] = ?,
                       [Image] = ?,
                       [Description] = ?,
                       [CategoryID] = ?,
                       [Available] = ?  
                       where ProductID = ?
                     """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            
            st.setString(1, p.getName());
            st.setString(2, p.getColor());
            st.setString(3, p.getRam());
            st.setString(4, p.getMemory());
            st.setInt(5, p.getPurchase());
            st.setInt(6, p.getPrice());
            st.setString(7, p.getImage());
            st.setString(8, p.getDescription());
            st.setInt(9, p.getCategoryID());
            st.setInt(10, p.getAvailable());
            st.setInt(11,p.getProductID() );
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }   
    }
}
