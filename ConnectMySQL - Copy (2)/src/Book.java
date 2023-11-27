public class Book {
    String bookCode;
    String title;
    String pubCode;
    String type;
    String paperback;
    public String getBookCode() {
        return bookCode;
    }
    public void setBookCode(String bookCode) {
        this.bookCode = bookCode.toUpperCase();
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getPubCode() {
        return pubCode;
    }
    public void setPubCode(String pubCode) {
        this.pubCode = pubCode;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getPaperback() {
        return paperback;
    }
    public void setPaperback(String paperback) {
        this.paperback = paperback;
    }
    public Book() {
    }
    public Book(String bookCode, String title, String pubCode, String type, String paperback) {
        this.bookCode = bookCode.toUpperCase();
        this.title = title;
        this.pubCode = pubCode;
        this.type = type;
        this.paperback = paperback;
    }
}
