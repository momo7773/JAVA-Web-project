package domain;
import java.sql.*;
public class OrderBean {
    private int iduser;
    private int idplace;
    private int idroom;
    private Timestamp Book_time;
    private int status;

    public Timestamp getBook_time() {
        return Book_time;
    }

    public void setBook_time(Timestamp book_time) {
        Book_time = book_time;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public int getIdplace() {
        return idplace;
    }

    public void setIdplace(int idplace) {
        this.idplace = idplace;
    }

    public int getIdroom() {
        return idroom;
    }

    public void setIdroom(int idroom) {
        this.idroom = idroom;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
