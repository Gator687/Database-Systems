public class Customer {
    String customerName;
    int CustomerNum;

    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    public int getCustomerNum() {
        return CustomerNum;
    }
    public void setCustomerNum(int customerNum) {
        CustomerNum = customerNum;
    }
    public Customer() {
    }
    public Customer(String customerName, int customerNum) {
        this.customerName = customerName;
        CustomerNum = customerNum;
    }
    @Override
    public String toString() {
        return customerName + ", " + CustomerNum;
    }
    
}