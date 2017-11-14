package entities;

public class Comments {

    private Long id;
    private Long id_goods;
    private String title;
    private String content;
    private String postDate;
    private String postTime;
    private String userName;
    private String userSurname;

    public Comments(Long id, Long id_goods, String title, String content, String postDate, String postTime, String userName, String userSurname) {
        this.id = id;
        this.id_goods = id_goods;
        this.title = title;
        this.content = content;
        this.postDate = postDate;
        this.postTime = postTime;
        this.userName = userName;
        this.userSurname = userSurname;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_goods() {
        return id_goods;
    }

    public void setId_goods(Long id_goods) {
        this.id_goods = id_goods;
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

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSurname() {
        return userSurname;
    }

    public void setUserSurname(String userSurname) {
        this.userSurname = userSurname;
    }
}