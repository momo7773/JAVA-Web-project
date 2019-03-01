package domain;

public class NewsBean {
    private String title;
    private String content;
    private String image;
    private int idplace;
    private int auto_incr;

    public int getAuto_incr() {
        return auto_incr;
    }

    public void setAuto_incr(int auto_incr) {
        this.auto_incr = auto_incr;
    }

    public int getIdplace() {
        return idplace;
    }

    public void setIdplace(int idplace) {
        this.idplace = idplace;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
