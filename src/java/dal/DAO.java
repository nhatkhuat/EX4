/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.*;
import model.Cart;
import model.Category;

/**
 *
 * @author Dell
 */
public class DAO extends DBContext {

    public List<Product> getAllProduct() {

        List<Product> sList = new ArrayList<>();
        String sql = "select * from Product where Available > 0";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String color = rs.getString("Color");
                String ram = rs.getString("Ram");
                String mem = rs.getString("Memory");
                 int purchase = rs.getInt("Purchase");
                int price = rs.getInt("Price");
                String img = rs.getString("Image");
                String des = rs.getString("Description");
                
                int catid = rs.getInt("CategoryID");
                int avai = rs.getInt("Available");
                
                Product s = new Product(id, name, color, ram, mem,purchase,
                        price, img, des, catid, avai);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }
    public int NumberOfProduct() {
        int number = 0;
        String sql = """
                     SELECT count(*) as Num FROM Product""";
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

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByCategoryID(int cateid) {

        List<Product> sList = new ArrayList<>();
        String sql = """
                     select * from Product
                     where CategoryID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cateid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String color = rs.getString("Color");
                String ram = rs.getString("Ram");
                String mem = rs.getString("Memory");
                 int purchase = rs.getInt("Purchase");
                int price = rs.getInt("Price");
                String img = rs.getString("Image");
                String des = rs.getString("Description");
                int catid = rs.getInt("CategoryID");
                int avai = rs.getInt("Available");
                Product s = new Product(id, name, color, ram, mem,purchase,
                        price, img, des, catid, avai);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public String getCategoryName(int cid) {
        String sql = """
                     select * from Category
                     where CategoryID = ?""";
        String name = "";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                name = rs.getString("Name");
            }
        } catch (SQLException ex) {
        }
        return name;
    }
    public int getCategoryID(String name) {
        String sql = """
                     select * from Category
                     where Name = ?""";
        int id = 0;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                id = rs.getInt("CategoryID");
            }
        } catch (SQLException ex) {
        }
        return id;
    }

    public Product getProductByProductID(int pid) {

        Product pro = new Product();
        String sql = """
                     select * from Product
                     where ProductID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, pid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String color = rs.getString("Color");
                String ram = rs.getString("Ram");
                String mem = rs.getString("Memory");
                 int purchase = rs.getInt("Purchase");
                int price = rs.getInt("Price");
                String img = rs.getString("Image");
                String des = rs.getString("Description");
                
                int catid = rs.getInt("CategoryID");
                int avai = rs.getInt("Available");
                
                pro = new Product(id, name, color, ram, mem,purchase,
                        price, img, des, catid, avai);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return pro;
    }
    
    
// Cart
    
    public List<Cart> getCartByCustomerID(int cusID) {

        List<Cart> listC = new ArrayList<>();
        String sql = """
                     select * from Cart c,Product p
                     where c.ProductID = p.ProductID
                     and c.CusID = ?
                     and InvoiceID is null""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cusID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("CartID");
                String date = rs.getString("Date");
                int quantity = rs.getInt("Quantity");
                int price = rs.getInt("Price");
                int total = price * quantity;
                int CusID = cusID;
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String img = rs.getString("Image");
                Cart s = new Cart(cartID, date, quantity, total, price, CusID, id,name, img,null);
                listC.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return listC;
    }
    public void updateProductAvailable(int quantity, int pid) {
        String sql = "UPDATE Product\n"
                + "set Available = ? "
                + "where ProductID=?";
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, quantity);
            st.setInt(2, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    
    
    
    
    
    public List<Product> searchByName(String txt) {
        List<Product> sList = new ArrayList<>();
        String sql = """
                     select * from Product
                     where Name like ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + txt + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String color = rs.getString("Color");
                String ram = rs.getString("Ram");
                String mem = rs.getString("Memory");
                int price = rs.getInt("Price");
                 int purchase = rs.getInt("Purchase");
                String img = rs.getString("Image");
                String des = rs.getString("Description");
                
                int catid = rs.getInt("CategoryID");
                int avai = rs.getInt("Available");
           
                Product s = new Product(id, name, color, ram, mem,purchase,
                        price, img, des,catid, avai);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public List<Product> searchByColor(String col) {
        List<Product> sList = new ArrayList<>();
        String sql = """
                     select * from Product
                     where Color like ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, col);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String color = rs.getString("Color");
                String ram = rs.getString("Ram");
                String mem = rs.getString("Memory");
                int price = rs.getInt("Price");
                 int purchase = rs.getInt("Purchase");
                String img = rs.getString("Image");
                String des = rs.getString("Description");
                
                int catid = rs.getInt("CategoryID");
                int avai = rs.getInt("Available");
                
                Product s = new Product(id, name, color, ram, mem,purchase,
                        price, img, des, catid, avai);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public List<Product> searchByRam(String r) {
        List<Product> sList = new ArrayList<>();
        String sql = """
                     select * from Product
                     where Ram like ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, r);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String color = rs.getString("Color");
                String ram = rs.getString("Ram");
                String mem = rs.getString("Memory");
                int price = rs.getInt("Price");
                 int purchase = rs.getInt("Purchase");
                String img = rs.getString("Image");
                String des = rs.getString("Description");
                
                int catid = rs.getInt("CategoryID");
                int avai = rs.getInt("Available");
                
                Product s = new Product(id, name, color, ram, mem,purchase,
                        price, img, des, catid, avai);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public List<Product> searchByRom(String r) {
        List<Product> sList = new ArrayList<>();
        String sql = """
                     select * from Product
                     where Memory like ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, r);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String color = rs.getString("Color");
                String ram = rs.getString("Ram");
                String mem = rs.getString("Memory");
                int price = rs.getInt("Price");
                 int purchase = rs.getInt("Purchase");
                String img = rs.getString("Image");
                String des = rs.getString("Description");
                
                int catid = rs.getInt("CategoryID");
                int avai = rs.getInt("Available");
                
                Product s = new Product(id, name, color, ram, mem,purchase,
                        price, img, des, catid, avai);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

}
