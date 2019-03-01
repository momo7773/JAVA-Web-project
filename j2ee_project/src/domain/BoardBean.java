package domain;

import java.sql.Timestamp;

public class BoardBean {
    int iduser;
    String title;
    String content;
    Timestamp sub_time;
    int like;
    String img;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
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

    public Timestamp getSub_time() {
        return sub_time;
    }

    public void setSub_time(Timestamp sub_time) {
        this.sub_time = sub_time;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }
}
