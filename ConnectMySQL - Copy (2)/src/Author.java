public class Author {
    String authorFirst;
    String authorLast;
    int authorNum;
    @Override
    public String toString() {
        return authorLast + " " + authorFirst;
    }
    public Author(){
    }
    public Author(String authorFirst, String authorLast, int authorNum) {
        this.authorFirst = authorFirst;
        this.authorLast = authorLast;
        this.authorNum = authorNum;
    }
    public String getAuthorFirst() {
        return authorFirst;
    }
    public void setAuthorFirst(String authorFirst) {
        this.authorFirst = authorFirst;
    }
    public String getAuthorLast() {
        return authorLast;
    }
    public void setAuthorLast(String authorLast) {
        this.authorLast = authorLast;
    }
    public int getAuthorNum() {
        return authorNum;
    }
    public void setAuthorNum(int authorNum) {
        this.authorNum = authorNum;
    }
}