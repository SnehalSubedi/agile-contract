package com.agilecontract.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.UUID;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Part;

public class ImageUtil {

    public static String saveProfileImage(ServletContext context, Part filePart, String subfolder) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        String fileName = UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();

        String uploadPath = "Macintosh HD/Users/snehalsubedi/eclipse-workspace/agile-contract/src/main/webapp/resources/uploads";

          File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        File file = new File(uploadDir, fileName);

        System.out.println("File will be saved at: " + file.getAbsolutePath());

        
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        }

        return fileName;
    }

    public static void deleteImage(String uploadDir, String fileName) {
        File file = new File(uploadDir, fileName);
        if (file.exists()) {
            file.delete();
        }
    }

    public static String updateProfileImage(ServletContext context, Part filePart, String existingFileName,
            String subfolder) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            if (existingFileName != null && !existingFileName.isEmpty()) {
                String uploadPath = "Macintosh HD/Users/snehalsubedi/eclipse-workspace/agile-contract/src/main/webapp/resources/uploads";
                deleteImage(uploadPath, existingFileName);
            }

            return saveProfileImage(context, filePart, subfolder);
        }

        return existingFileName;
    }
}
