/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class Product {
    int ProductID;
    String Name;
    String Color;
    String Ram;
    String Memory;
    int Purchase;
    int Price;
    String Image;
    String Description;
    int CategoryID;
    int Available;

    public Product() {
    }

    public Product(int ProductID, String Name, String Color, String Ram, String Memory, int Purchase, int Price, String Image, String Description, int CategoryID, int Available) {
        this.ProductID = ProductID;
        this.Name = Name;
        this.Color = Color;
        this.Ram = Ram;
        this.Memory = Memory;
        this.Purchase = Purchase;
        this.Price = Price;
        this.Image = Image;
        this.Description = Description;
        this.CategoryID = CategoryID;
        this.Available = Available;
    }


    public int getPurchase() {
        return Purchase;
    }

    public void setPurchase(int Purchase) {
        this.Purchase = Purchase;
    }



    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public int getAvailable() {
        return Available;
    }

    public void setAvailable(int Available) {
        this.Available = Available;
    }


    public String getRam() {
        return Ram;
    }

    public void setRam(String Ram) {
        this.Ram = Ram;
    }

    public String getMemory() {
        return Memory;
    }

    public void setMemory(String Memory) {
        this.Memory = Memory;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    @Override
    public String toString() {
        return "Product{" + "ProductID=" + ProductID + ", Name=" + Name + ", Color=" + Color + ", Ram=" + Ram + ", Memory=" + Memory + ", Purchase=" + Purchase + ", Price=" + Price + ", Image=" + Image + ", Description=" + Description + ", CategoryID=" + CategoryID + ", Available=" + Available + '}';
    }


}
