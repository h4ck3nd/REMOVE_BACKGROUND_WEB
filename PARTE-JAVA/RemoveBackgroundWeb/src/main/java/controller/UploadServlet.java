package controller;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024)
public class UploadServlet extends HttpServlet {

    private BufferedImage removeBackground(BufferedImage image) {
        int width = image.getWidth();
        int height = image.getHeight();
        BufferedImage transparent = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);

        int tolerance = 30;

        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                int pixel = image.getRGB(x, y);

                int r = (pixel >> 16) & 0xFF;
                int g = (pixel >> 8) & 0xFF;
                int b = pixel & 0xFF;

                if (r > 255 - tolerance && g > 255 - tolerance && b > 255 - tolerance) {
                    transparent.setRGB(x, y, 0x00FFFFFF);
                } else {
                    transparent.setRGB(x, y, pixel);
                }
            }
        }
        return transparent;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("image");

        File tempInput = File.createTempFile("input_", ".png");
        try (InputStream input = filePart.getInputStream();
             OutputStream out = new FileOutputStream(tempInput)) {
            byte[] buffer = new byte[4096];
            int len;
            while ((len = input.read(buffer)) != -1) {
                out.write(buffer, 0, len);
            }
        }

        String apiKey = "<TOKEN>"; // Cambia por tu TOKEN (50 imagenes gratis por mes)
        File outputFile = File.createTempFile("bg_removed_", ".png");

        ProcessBuilder pb = new ProcessBuilder("curl", "-s",
                "-H", "X-Api-Key: " + apiKey,
                "-F", "image_file=@" + tempInput.getAbsolutePath(),
                "-F", "size=auto",
                "-o", outputFile.getAbsolutePath(),
                "https://api.remove.bg/v1.0/removebg");

        Process process = pb.start();
        int exitCode;
        try {
            exitCode = process.waitFor();
        } catch (InterruptedException e) {
            throw new IOException("Error waiting for background removal process", e);
        }

        if (exitCode != 0 || !outputFile.exists()) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al quitar fondo.");
            return;
        }

        // Guardar historial en sesión
        HttpSession session = request.getSession();
        List<String> history = (List<String>) session.getAttribute("history");
        if (history == null) {
            history = new ArrayList<>();
        }
        history.add(outputFile.getName());
        session.setAttribute("history", history);

        request.setAttribute("imageName", outputFile.getName());
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
