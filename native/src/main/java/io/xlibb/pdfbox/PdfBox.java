// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).

// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

package io.xlibb.pdfbox;

import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BString;
import io.xlibb.pdfbox.utils.Utils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.text.PDFTextStripper;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;

public class PdfBox {

    private static final String CORRUPTED_ERROR = "error: Invalid or corrupted PDF file. Provided: ";
    private static final String INVALID_PATH_ERROR = "error: The system cannot find the path specified. Provided: ";
    private static final String INVALID_URL_ERROR = "error: The system cannot find the URL specified. Provided: ";
    private static final String INVALID_EXTENSION_ERROR = "error: Unsupported file type. " +
            "A .pdf file is expected. Provided: ";

    public static Object toImagesFromFile(BString filePath) {
        try {
            if (isValidFile(filePath.toString())) {
                File file = new File(filePath.toString());
                PDDocument document = PDDocument.load(file);
                BString[] base64Images = toImages(document);
                document.close();
                return ValueCreator.createArrayValue(base64Images);
            }
            return null;
        } catch (IllegalArgumentException e) {
            return Utils.getBError(e.getMessage(), e);
        } catch (IOException e) {
            return Utils.getBError(CORRUPTED_ERROR + filePath, e);
        }
    }

    public static Object toStringFromEncodedText(BString content) {
        try {
            String encodedContent = content.getValue().replaceAll("\\s+", "");
            byte[] pdfBytes = Base64.getDecoder().decode(encodedContent);
            PDDocument document = PDDocument.load(new ByteArrayInputStream(pdfBytes));
            PDFTextStripper stripper = new PDFTextStripper();
            return  StringUtils.fromString(stripper.getText(document));
        } catch (Exception e) {
            return Utils.getBError(e.getMessage(), e);
        }
    }

    public static Object toImagesFromURL(BString url) {
        try {
            if (isValidURL(url.toString())) {
                URL urlObj = new URL(url.toString());
                InputStream inputStream = urlObj.openStream();
                PDDocument document = PDDocument.load(inputStream);
                BString[] base64Images = toImages(document);
                document.close();
                return ValueCreator.createArrayValue(base64Images);
            }
            return null;
        } catch (IllegalArgumentException e) {
            return Utils.getBError(e.getMessage(), e);
        } catch (IOException e) {
            return Utils.getBError(CORRUPTED_ERROR + url, e);
        }
    }

    public static Object toImagesFromBytes(BArray byteArr) {
        try {
            if (isValidBytes(byteArr.getBytes())) {
                byte[] bytes = byteArr.getBytes();
                PDDocument document = PDDocument.load(bytes);
                BString[] base64Images = toImages(document);
                document.close();
                return ValueCreator.createArrayValue(base64Images);
            }
            return null;
        } catch (IllegalArgumentException e) {
            return Utils.getBError(e.getMessage(), e);
        } catch (IOException e) {
            return Utils.getBError("error: Invalid or corrupted PDF file.", e);
        }
    }

    public static Object toTextFromFile(BString filePath) {
        try {
            if (isValidFile(filePath.toString())) {
                File file = new File(filePath.toString());
                PDDocument document = PDDocument.load(file);
                BString[] textFromPages = toText(document);
                document.close();
                return ValueCreator.createArrayValue(textFromPages);
            }
            return null;
        } catch (IllegalArgumentException e) {
            return Utils.getBError(e.getMessage(), e);
        } catch (IOException e) {
            return Utils.getBError(CORRUPTED_ERROR + filePath, e);
        }
    }

    public static Object toTextFromURL(BString url) {
        try {
            if (isValidURL(url.toString())) {
                URL urlObj = new URL(url.toString());
                InputStream inputStream = urlObj.openStream();
                PDDocument document = PDDocument.load(inputStream);
                BString[] textFromPages = toText(document);
                document.close();
                return ValueCreator.createArrayValue(textFromPages);
            }
            return null;
        } catch (IllegalArgumentException e) {
            return Utils.getBError(e.getMessage(), e);
        } catch (IOException e) {
            return Utils.getBError(CORRUPTED_ERROR + url, e);
        }
    }

    public static Object toTextFromBytes(BArray byteArr) {
        try {
            if (isValidBytes(byteArr.getBytes())) {
                byte[] bytes = byteArr.getBytes();
                PDDocument document = PDDocument.load(bytes);
                BString[] textFromPages = toText(document);
                document.close();
                return ValueCreator.createArrayValue(textFromPages);
            }
            return null;
        } catch (IllegalArgumentException e) {
            return Utils.getBError(e.getMessage(), e);
        } catch (IOException e) {
            return Utils.getBError("error: Invalid or corrupted PDF file.", e);
        }
    }

    private static BString[] toImages(PDDocument document) throws IOException {
        PDFRenderer pdfRenderer = new PDFRenderer(document);
        List<BufferedImage> images = new ArrayList<>();

        int numberOfPages = document.getNumberOfPages();
        BString[] encodedImages = new BString[numberOfPages];

        for (int i = 0; i < numberOfPages; ++i) {
            BufferedImage bImage = pdfRenderer.renderImageWithDPI(i, 400, ImageType.RGB);
            images.add(bImage);
        }
        document.close();
        for (int i = 0; i < images.size(); i++) {
            String base64Image = encodeConvertedImage(images.get(i), i);
            encodedImages[i] = StringUtils.fromString(base64Image);
        }
        return encodedImages;
    }

    private static String encodeConvertedImage(BufferedImage image, int i) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ImageIO.write(image, "png", byteArrayOutputStream);
        byte[] bytes = byteArrayOutputStream.toByteArray();
        return Base64.getEncoder().encodeToString(bytes);
    }

    private static BString[] toText(PDDocument document) throws IOException {

        PDFTextStripper textStripper = new PDFTextStripper();
        int noOfPages = document.getNumberOfPages();
        BString[] textFromPages = new BString[noOfPages];

        for (int i = 1; i <= document.getNumberOfPages(); i++) {
            textStripper.setStartPage(i);
            textStripper.setEndPage(i);
            textFromPages[i - 1] = StringUtils.fromString(textStripper.getText(document));
        }

        return textFromPages;
    }

    private static boolean isValidFile(String path) throws IllegalArgumentException {
        File file = new File(path);
        if (!file.exists()) {
            throw new IllegalArgumentException(INVALID_PATH_ERROR + path);
        }
        if (!path.endsWith(".pdf")) {
            throw new IllegalArgumentException(INVALID_EXTENSION_ERROR + path);
        }
        return true;
    }

    private static boolean isValidBytes(byte[] bytes) throws IllegalArgumentException {
        String header = new String(bytes, 0, Math.min(bytes.length, 4), StandardCharsets.UTF_8);
        if (!header.startsWith("%PDF")) {
            throw new IllegalArgumentException("error: Unsupported file type. Expected .pdf file.");
        }
        return true;
    }

    private static boolean isValidURL(String fileUrl) throws IOException {
        try {
            URL url = new URL(fileUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IllegalArgumentException(INVALID_URL_ERROR + fileUrl);
            }

            String contentType = connection.getContentType();
            if (contentType == null || !contentType.equals("application/pdf")) {
                throw new IllegalArgumentException(INVALID_EXTENSION_ERROR + fileUrl);
            }
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(e.getMessage());
        } catch (IOException e) {
            throw new IllegalArgumentException(INVALID_URL_ERROR + fileUrl);
        }
        return true;
    }
}
