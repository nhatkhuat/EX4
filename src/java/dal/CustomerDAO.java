/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author hihihihaha
 */
public class CustomerDAO extends DBContext {

    public List<Customer> getAllCustomer() {

        List<Customer> sList = new ArrayList<>();
        String sql = "select * from Customer "
                + "where CusID !=1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("CusID");
                String fullname = rs.getString("Fullname");
                String dob = rs.getString("Dob");
                int gender = rs.getInt("Gender");
                int CusID = rs.getInt("CusID");
                String phone = rs.getString("PhoneNumber");
                String email = rs.getString("Email");
                Customer s = new Customer(CusID, fullname, gender, dob, phone, email);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public Customer getCustomerByID(int cusid) {
        Customer cus = new Customer();
        String sql = "SELECT * FROM Customer WHERE CusID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cusid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
            System.err.println(e);
        }
        return cus;
    }

    public Customer getCustomerByPhone(String phone) {
        Customer cus = new Customer();
        String sql = "SELECT * FROM Customer WHERE PhoneNumber = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
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
            System.err.println(e);
        }
        return cus;
    }

    public Customer getCustomerByMail(String mail) {
        Customer cus = new Customer();
        String sql = "SELECT * FROM Customer WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
            System.err.println(e);
        }
        return cus;
    }

    public Customer getNewCustomer() {
        Customer cus = new Customer();
        String sql = """
                     select top 1 * 
                     from Customer
                     order by CusID
                     desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
            System.err.println(e);
        }
        return cus;

    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        System.out.println(dao.getNewCustomer());
    }

    public void addCustomer(String name, String email) throws SQLException {
        String sql = "INSERT INTO Customer(FullName, Email) VALUES (?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void addCustomer(Customer cus) throws SQLException {
        String sql = "INSERT INTO Customer(FullName,Gender,Dob, PhoneNumber,Email) VALUES (?,?,?,?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, cus.getFullName());
            st.setInt(2, cus.getGender());
            st.setString(3, cus.getDob());
            st.setString(4, cus.getPhoneNumber());
            st.setString(5, cus.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateCustomer(int cusid, String name, int gender, String dob, String phone, String email) {
        String sql = """
                     update Customer
                     set FullName = ?,
                     Gender = ?,
                     Dob = ?,
                     PhoneNumber = ?,
                     Email = ?
                     where CusID = ?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);
            st.setInt(2, gender);
            st.setString(3, dob);
            st.setString(4, phone);
            st.setString(5, email);
            st.setInt(6, cusid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateCustomer(int cusid, String name, String phone, String email) {
        String sql = """
                     update Customer
                     set FullName = ?,
                     PhoneNumber = ?,
                     Email = ?
                     where CusID = ?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);
            st.setString(2, phone);
            st.setString(3, email);
            st.setInt(4, cusid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void deleteCustomer(int cusid) {
        String sql = """
                     delete from Customer
                     where CusID = ?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cusid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }

    }

    public Customer TopCustomer() {
        Customer cus = new Customer();
        String sql = """
                     SELECT top 1 Cus.CusID ,cus.FullName,cus.Dob,cus.Gender,cus.Email,cus.PhoneNumber, sum(Total) as Total
                     FROM Cart c, Customer cus
                     where c.CusID = cus.CusID and InvoiceID is not null
                     group by cus.CusID,cus.FullName,cus.PhoneNumber,cus.Dob,cus.Email,cus.Gender
                     order by sum(Total) desc  """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
            System.err.println(e);
        }
        return cus;

    }

}
