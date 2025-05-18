package com.agilecontract.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.UUID;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Part;

public class ImageUtil {

    public static String saveProfileImage(ServletContext context, Part filePart, String subfsolder) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        // Generate a unique file name
        String fileName = UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();

        // Set the upload path to be the custom directory
        String uploadPath = "/Users/snehalsubedi/eclipse-workspace/agile-contract/src/main/webapp/resources/uploads";

        // Ensure the directory exists
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Create the file object
        File file = new File(uploadDir, fileName);

        // Log the upload path and file name for debugging
        System.out.println("File will be saved at: " + file.getAbsolutePath());

        // Save the uploaded file
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
        // If a new image is provided, delete the old one and save the new one
        if (filePart != null && filePart.getSize() > 0) {
            // Delete the existing image if present
            if (existingFileName != null && !existingFileName.isEmpty()) {
                String uploadPath = "/Users/snehalsubedi/eclipse-workspace/agile-contract/src/main/webapp/resources/uploads";
                deleteImage(uploadPath, existingFileName);
            }

            // Save the new image and return the new file name
            return saveProfileImage(context, filePart, subfolder);
        }

        // If no new file is provided, return the existing file name
        return existingFileName;
    }
}
