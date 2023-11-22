import java.text.DecimalFormat;

public class BookAndPrice {
    String title;
    double price;
    DecimalFormat money = new DecimalFormat("$#,##0.00");
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public BookAndPrice() {
    }
    public BookAndPrice(String title, double price) {
        this.title = title;
        this.price = price;
    }
    @Override
    public String toString() {
        return title + " " + money.format(price);
    }
    
}
