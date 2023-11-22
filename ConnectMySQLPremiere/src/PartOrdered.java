public class PartOrdered {
    String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PartOrdered() {
    }

    public PartOrdered(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return description;
    }
    
}
