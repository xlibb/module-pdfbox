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

import ballerina/jballerina.java;

# Converts a PDF document located at the specified file path into an array of Base64-encoded images.
#
# + filePath - The file path of the PDF document to be converted.
# + return - If the conversion is successful, returns an array of Base64-encoded images representing each page of the PDF. Otherwise, returns an error.
public isolated function toImagesFromFile(string filePath) returns string[]|Error = @java:Method {
    'class: "io.ballerina.lib.pdfbox.PdfBox"
} external;

# Converts a PDF document accessible via a given URL into an array of Base64-encoded images.
#
# + url - The URL of the PDF document to be converted.
# + return - If the conversion is successful, returns an array of Base64-encoded images representing each page of the PDF. Otherwise, returns an error.
public isolated function toImagesFromURL(string url) returns string[]|Error = @java:Method {
    'class: "io.ballerina.lib.pdfbox.PdfBox"
} external;

# Converts a PDF document provided as a byte array into an array of Base64-encoded images.
#
# + byteArray - The byte array representing the PDF document to be converted.
# + return - If the conversion is successful, returns an array of Base64-encoded images representing each page of the PDF. Otherwise, returns an error.
public isolated function toImagesFromBytes(byte[] byteArray) returns string[]|Error = @java:Method {
    'class: "io.ballerina.lib.pdfbox.PdfBox"
} external;

# Extracts text content from a PDF document located at the specified file path.
#
# + filePath - The file path of the PDF document to extract text from.
# + return - If successful, returns an array of text strings where each element represents text extracted from a page of the PDF. Otherwise, returns an error.
public isolated function toTextFromFile(string filePath) returns string[]|Error = @java:Method {
    'class: "io.ballerina.lib.pdfbox.PdfBox"
} external;

# Extracts text content from a PDF document accessible via a given URL.
#
# + url - The URL of the PDF document to extract text from.
# + return - If successful, returns an array of text strings where each element represents text extracted from a page of the PDF. Otherwise, returns an error.
public isolated function toTextFromURL(string url) returns string[]|Error = @java:Method {
    'class: "io.ballerina.lib.pdfbox.PdfBox"
} external;

# Extracts text content from a PDF document provided as a byte array.
#
# + byteArray - The byte array representing the PDF document to extract text from.
# + return - If successful, returns an array of text strings where each element represents text extracted from a page of the PDF. Otherwise, returns an error.
public isolated function toTextFromBytes(byte[] byteArray) returns string[]|Error = @java:Method {
    'class: "io.ballerina.lib.pdfbox.PdfBox"
} external;
