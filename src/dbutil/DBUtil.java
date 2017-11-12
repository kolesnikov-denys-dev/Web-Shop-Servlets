package dbutil;

import entities.Goods;
import entities.Users;

import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.lang.Integer.parseInt;

public class DBUtil {

    private Connection connection;

    public DBUtil() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/myjdbc", "root", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addUser(String email, String password, String name, String surname, int age) {
        try {
            Statement st = connection.createStatement();
            st.executeUpdate("INSERT INTO users (email, password, name, surname, age) " +
                    "VALUES (\"" + email + "\",\"" + password + "\",\"" + name + "\",\"" + surname + "\"," + age + ")");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Users> listUsers() {
        ArrayList<Users> usersList = new ArrayList();
        try {
            Statement st = connection.createStatement();
            ResultSet result = st.executeQuery("SELECT id, email, password, name, surname, age FROM users ORDER BY id ASC");
            while (result.next()) {
                int id = result.getInt("id");
                String email = result.getString("email");
                String password = result.getString("password");
                String name = result.getString("name");
                String surname = result.getString("surname");
                int age = result.getInt("age");
                Users u = new Users(id, email, password, name, surname, age);
                usersList.add(u);
            }
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usersList;
    }

    public void deleteUser(String idUser) {
        try {
            Statement st = connection.createStatement();
            st.executeUpdate("DELETE FROM users WHERE id = \"" + idUser + "\"");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Users getUserById(int id) {
        Users getUser = null;
        for (Users x : listUsers()) {
            if (id == x.getId()) {
                getUser = x;
            }
        }
        return getUser;
    }

    public void updateUser(String email, String password, String name, String surname, int age, String id) {
        try {
            Statement st = connection.createStatement();
            st.executeUpdate("UPDATE users SET  email=\"" + email + "\", password=\"" + password + "\",name=\"" + name + "\",surname=\"" + surname + "\",age=" + age + "  WHERE id = \"" + id + "\"");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Users getUserByEmailAndPassword(String email, String password) {
        Users userEmpty = null;
        for (Users y : listUsers()) {
            if (y.getEmail().equals(email) && y.getPassword().equals(password)) {
                userEmpty = y;
            }
        }
        return userEmpty;
    }

    public ArrayList<Goods> showMyGoods(Users u) {
        int get_id_user = u.getId();
        ArrayList<Goods> listGoods = new ArrayList<Goods>();
        try {
            PreparedStatement preparedStatement = null;
            preparedStatement = connection.prepareStatement("SELECT * FROM goods WHERE id_user = ?");
            preparedStatement.setInt(1, get_id_user);
            ResultSet result = preparedStatement.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                int id_user = result.getInt("id_user");
                int published = result.getInt("published");
                String date = result.getString("date");
                String time = result.getString("time");
                int view_count = result.getInt("view_count");
                int price = result.getInt("price");
                String description = result.getString("description");
                String photo = result.getString("photo");
                String title = result.getString("title");
                int category = result.getInt("category");
                Goods g = new Goods(id, id_user, published, date, time, view_count, price, description, photo, title, category);
                listGoods.add(g);
            }
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listGoods;
    }

    public void deleteGoodsById(String idGoods) {
        try {
            Statement st = connection.createStatement();
            st.executeUpdate("DELETE FROM goods WHERE id = \"" + idGoods + "\"");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Goods getGoodsById(String idG) {
        Goods goods = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM goods WHERE id= \"" + idG + "\"  ");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int idUser = resultSet.getInt("id_user");
                int published = resultSet.getInt("published");
                String date = resultSet.getString("date");
                String time = resultSet.getString("time");
                int viewCount = resultSet.getInt("view_count");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String photo = resultSet.getString("photo");
                String title = resultSet.getString("title");
                int category = resultSet.getInt("category");
                goods = new Goods(id, idUser, published, date, time, viewCount, price, description, photo, title, category);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return goods;
    }

    public boolean emailAlreadyExist(String email) {
        boolean exist = false;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT email FROM users");
            while (resultSet.next()) {
                if (email.equals(resultSet.getString("email"))) {
                    exist = true;
                    break;
                } else {
                    exist = false;
                }
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exist;
    }

    public ArrayList<Goods> getGoodsByParam(String search, String category) {
        ArrayList<Goods> goodsList = new ArrayList<Goods>();
        Goods goods = null;
        if (category == null) category = "0";
        if (search == null) search = "";
        try {
            Statement statement = connection.createStatement();
            String queryAll = "SELECT * FROM goods";
            boolean x = category.equals("0");
            if (search != null && x != true) {
                queryAll = "SELECT * FROM goods WHERE published='1' AND category=\"" + category + "\" AND \n" +
                        "(LOWER(title) LIKE LOWER(\"%" + search + "%\") OR LOWER(description) LIKE LOWER(\"%" + search + "%\"))";
            } else if (category.equals("0")) {
                queryAll = "SELECT * FROM goods WHERE published='1' AND \n" +
                        "(LOWER(title) LIKE LOWER(\"%" + search + "%\") OR LOWER(description) LIKE LOWER(\"%" + search + "%\"))";
            } else {
                queryAll = "SELECT * FROM goods WHERE published='1' AND category=\"" + category + "\"";
            }
            ResultSet resultSet = statement.executeQuery(queryAll);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int idUser = resultSet.getInt("id_user");
                int published = resultSet.getInt("published");
                String date = resultSet.getString("date");
                String time = resultSet.getString("time");
                int viewCount = resultSet.getInt("view_count");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String photo = resultSet.getString("photo");
                String title = resultSet.getString("title");
                int category1 = resultSet.getInt("category");
                goods = new Goods(id, idUser, published, date, time, viewCount, price, description, photo, title, category1);
                goodsList.add(goods);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return goodsList;
    }


    public void updatePassword(String id, String password) {

        System.out.println(id+ " --------------id");
        System.out.println(password+ " --------------pas");
        try {
            Statement st = connection.createStatement();
            st.executeUpdate("UPDATE users SET  password=\"" + password+ "\" WHERE id=\"" + id + "\"");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
