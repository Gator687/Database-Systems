public class Part {
    String PartNum;
    String Description;
    int OnHand;
    String partClass;
    String Warehouse;
    Double Price;
    public String getPartNum() {
        return PartNum;
    }
    public void setPartNum(String partNum) {
        PartNum = partNum;
    }
    public String getDescription() {
        return Description;
    }
    public void setDescription(String description) {
        Description = description;
    }
    public int getOnHand() {
        return OnHand;
    }
    public void setOnHand(int onHand) {
        OnHand = onHand;
    }
    public String getPartClass() {
        return partClass;
    }
    public void setPartClass(String partClass) {
        this.partClass = partClass;
    }
    public String getWarehouse() {
        return Warehouse;
    }
    public void setWarehouse(String warehouse) {
        Warehouse = warehouse;
    }
    public Double getPrice() {
        return Price;
    }
    public void setPrice(Double price) {
        Price = price;
    }
    public Part() {
    }
    public Part(String partNum, String description, int onHand, String partClass, String warehouse, Double price) {
        PartNum = partNum;
        Description = description;
        OnHand = onHand;
        this.partClass = partClass;
        Warehouse = warehouse;
        Price = price;
    }
}
