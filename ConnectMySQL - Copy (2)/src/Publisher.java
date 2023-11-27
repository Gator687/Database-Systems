public class Publisher {
    String pubCode;
    String pubName;
    public String getPubCode() {
        return pubCode;
    }
    public void setPubCode(String pubCode) {
        this.pubCode = pubCode;
    }
    public String getPubName() {
        return pubName;
    }
    public void setPubName(String pubName) {
        this.pubName = pubName;
    }
    public Publisher() {
    }
    public Publisher(String pubCode, String pubName) {
        this.pubCode = pubCode;
        this.pubName = pubName;
    }
    @Override
    public String toString() {
        return pubName;
    }
}
