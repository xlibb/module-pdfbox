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

package io.ballerina.lib.pdfbox;

import io.ballerina.lib.pdfbox.utils.Utils;
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BString;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.text.PDFTextStripper;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;

public class PdfBox {

    public static Object toImagesFromFile(BString filePath) {
        try {
            File file = new File(filePath.toString());
            PDDocument document = PDDocument.load(file);
            BString[] base64Images = toImages(document);
            document.close();
            return ValueCreator.createArrayValue(base64Images);
        } catch (IOException e) {
            return Utils.getBError("Failed to load document: " + e.getMessage());
        }
    }

    public static Object toImagesFromURL(BString url) {
        try {
            URL urlObj = new URL(url.toString());
            InputStream inputStream = urlObj.openStream();
            PDDocument document = PDDocument.load(inputStream);
            BString[] base64Images = toImages(document);
            document.close();
            return ValueCreator.createArrayValue(base64Images);
        } catch (IOException e) {
            return Utils.getBError("Failed to load document: " + e.getMessage());
        }
    }

    public static Object toImagesFromBytes(BArray byteArr) {
        try {
            byte[] bytes = byteArr.getBytes();
            PDDocument document = PDDocument.load(bytes);
            BString[] base64Images = toImages(document);
            document.close();
            return ValueCreator.createArrayValue(base64Images);
        } catch (IOException e) {
            return Utils.getBError("Failed to load document: " + e.getMessage());
        }
    }

    public static Object toTextFromFile(BString filePath) {
        try {
            File file = new File(filePath.toString());
            PDDocument document = PDDocument.load(file);
            BString[] textFromPages = toText(document);
            document.close();
            return ValueCreator.createArrayValue(textFromPages);
        } catch (IOException e) {
            return Utils.getBError("Failed to load document: " + e.getMessage());
        }
    }

    public static Object toTextFromURL(BString url) {
        try {
            URL urlObj = new URL(url.toString());
            InputStream inputStream = urlObj.openStream();
            PDDocument document = PDDocument.load(inputStream);
            BString[] textFromPages = toText(document);
            document.close();
            return ValueCreator.createArrayValue(textFromPages);
        } catch (IOException e) {
            return Utils.getBError("Failed to load document: " + e.getMessage());
        }
    }

    public static Object toTextFromBytes(BArray byteArr) {
        try {
            byte[] bytes = byteArr.getBytes();
            PDDocument document = PDDocument.load(bytes);
            BString[] textFromPages = toText(document);
            document.close();
            return ValueCreator.createArrayValue(textFromPages);
        } catch (IOException e) {
            return Utils.getBError("Failed to load document: " + e.getMessage());
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
}
