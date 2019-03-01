package domain;

public class ShowNewsBean {
    private String title;
    private String content;
    private String image;
    private String sub_time;
    private int auto_incr;

    public int getAuto_incr() {
        return auto_incr;
    }

    public void setAuto_incr(int auto_incr) {
        this.auto_incr = auto_incr;
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

    public String getSub_time() {
        return sub_time;
    }

    public void setSub_time(String sub_time) {
        this.sub_time = sub_time;
    }
}
