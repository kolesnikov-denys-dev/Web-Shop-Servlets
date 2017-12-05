package entities;


public class Goods {
    private int id;
    private int id_user;
    private int published;
    private String date;
    private String time;
    private int view_count;
    private int price;
    private String description;
    private String photo;
    private String title;
    private int category;

    public Goods(int id, int id_user, int published, String date, String time, int view_count, int price, String description, String photo, String title, int category) {
        this.id = id;
        this.id_user = id_user;
        this.published = published;
        this.date = date;
        this.time = time;
        this.view_count = view_count;
        this.price = price;
        this.description = description;
        this.photo = photo;
        this.title = title;
        this.category = category;
    }

    public Goods(int id_user, int published, String date, String time, int price, String description, String photo, String title, int category) {
        this.id_user = id_user;
        this.published = published;
        this.date = date;
        this.time = time;
        this.price = price;
        this.description = description;
        this.photo = photo;
        this.title = title;
        this.category = category;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getPublished() {
        return published;
    }

    public void setPublished(int published) {
        this.published = published;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", id_user=" + id_user +
                ", published=" + published +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", view_count=" + view_count +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", photo='" + photo + '\'' +
                ", title='" + title + '\'' +
                ", category=" + category +
                '}';
    }
}
