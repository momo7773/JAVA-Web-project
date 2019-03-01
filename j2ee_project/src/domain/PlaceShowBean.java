package domain;

public class PlaceShowBean {
    private String place;
    private String time;
    private String vacant;
    private String max;

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
        System.out.println("set了");
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
        System.out.println("set了");
    }

    public String getVacant() {
        return vacant;
    }

    public void setVacant(String vacant) {
        this.vacant = vacant;
        System.out.println("set了");
    }

    public String getMax() {
        return max;
    }

    public void setMax(String max) {
        this.max = max;
        System.out.println("set了");
    }
}
