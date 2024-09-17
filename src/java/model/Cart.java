/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class Cart {

    int CartID;
    String Date;
    int Quantity;
    int total;
    int price;
    int CusID;
    int ProductID;
    String ProductName;
    String Image;
    String invoiceID;

    public Cart() {
    }

    public Cart(int CartID, String Date, int Quantity, int total, int price, int CusID, int ProductID, String ProductName, String Image, String invoiceID) {
        this.CartID = CartID;
        this.Date = Date;
        this.Quantity = Quantity;
        this.total = total;
        this.price = price;
        this.CusID = CusID;
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Image = Image;
        this.invoiceID = invoiceID;
    }

    public String getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(String invoiceID) {
        this.invoiceID = invoiceID;
    }

    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCusID() {
        return CusID;
    }

    public void setCusID(int CusID) {
        this.CusID = CusID;
    }

    public int getProductID() {
        return ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    @Override
    public String toString() {
        return "Cart{" + "CartID=" + CartID + ", Date=" + Date + ", Quantity=" + Quantity + ", total=" + total + ", price=" + price + ", CusID=" + CusID + ", ProductID=" + ProductID + ", ProductName=" + ProductName + ", Image=" + Image + '}';
    }

}
