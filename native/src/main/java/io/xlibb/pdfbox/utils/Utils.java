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

package io.xlibb.pdfbox.utils;

import io.ballerina.runtime.api.creators.ErrorCreator;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BError;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

public class Utils {

    public static final String ERROR_TYPE = "Error";

    public static BError getBError(String message, Throwable throwable) {
        BError cause = ErrorCreator.createError(throwable);
        return ErrorCreator.createError(ModuleUtils.getModule(), ERROR_TYPE, StringUtils.fromString(message),
                cause, null);
    }

    public static PDType1Font getFont(String fontName) {
        return switch (fontName) {
            case "Times-Roman" -> PDType1Font.TIMES_ROMAN;
            case "Times-Bold" -> PDType1Font.TIMES_BOLD;
            case "Times-Italic" -> PDType1Font.TIMES_ITALIC;
            case "Times-BoldItalic" -> PDType1Font.TIMES_BOLD_ITALIC;
            case "Helvetica" -> PDType1Font.HELVETICA;
            case "Helvetica-Bold" -> PDType1Font.HELVETICA_BOLD;
            case "Helvetica-Oblique" -> PDType1Font.HELVETICA_OBLIQUE;
            case "Helvetica-BoldOblique" -> PDType1Font.HELVETICA_BOLD_OBLIQUE;
            case "Courier" -> PDType1Font.COURIER;
            case "Courier-Bold" -> PDType1Font.COURIER_BOLD;
            case "Courier-Oblique" -> PDType1Font.COURIER_OBLIQUE;
            case "Courier-BoldOblique" -> PDType1Font.COURIER_BOLD_OBLIQUE;
            case "Symbol" -> PDType1Font.SYMBOL;
            case "ZapfDingbats" -> PDType1Font.ZAPF_DINGBATS;
            default -> PDType1Font.HELVETICA;
        };
    }
}
