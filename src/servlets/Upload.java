package servlets;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

@WebServlet("/upload")
public class Upload extends HttpServlet {
    protected void doPost(HttpServletRequest res, HttpServletResponse response)
        throws ServletException, IOException {

        try {

            BufferedImage originalImage = ImageIO.read(new File(
                    "c:\\image\\mypic.jpg"));

            ImageIO.write(originalImage, "jpg", new File(
                    "c:\\image\\mypic_new.jpg"));

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

    }
}
