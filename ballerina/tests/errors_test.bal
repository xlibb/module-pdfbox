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

import ballerina/io;
import ballerina/test;

@test:Config
function testInvalidExtensionFromFile() {
    string invalidPath = localBaseUrl + "invalidFile.png";
    string[]|Error actualValue = toImagesFromFile(invalidPath);
    validateError(actualValue, "error: Unsupported file type. A .pdf file is expected. Provided: " + invalidPath);
    actualValue = toTextFromFile(invalidPath);
    validateError(actualValue, "error: Unsupported file type. A .pdf file is expected. Provided: " + invalidPath);
}

@test:Config
function testNonExistentLocalFile() {
    string nonExistentPath = localBaseUrl + "notExistsDoc.pdf";
    string[]|Error actualValue = toImagesFromFile(nonExistentPath);
    validateError(actualValue, "error: The system cannot find the path specified. Provided: " + nonExistentPath);
    actualValue = toTextFromFile(nonExistentPath);
    validateError(actualValue, "error: The system cannot find the path specified. Provided: " + nonExistentPath);
}

@test:Config
function testCorruptedPDFFromFile() {
    string corruptedPDFPath = localBaseUrl + "corruptedDoc.pdf";
    string[]|Error actualValue = toImagesFromFile(corruptedPDFPath);
    validateError(actualValue, "error: Invalid or corrupted PDF file. Provided: " + corruptedPDFPath);
    actualValue = toTextFromFile(corruptedPDFPath);
    validateError(actualValue, "error: Invalid or corrupted PDF file. Provided: " + corruptedPDFPath);
}

@test:Config
function testInvalidExtensionFromUrl() {
    string invalidURL = onlineBaseUrl + "invalidFile.png";
    string[]|Error actualValue = toImagesFromURL(invalidURL);
    validateError(actualValue, "error: Unsupported file type. A .pdf file is expected. Provided: " + invalidURL);
    actualValue = toTextFromURL(invalidURL);
    validateError(actualValue, "error: Unsupported file type. A .pdf file is expected. Provided: " + invalidURL);
}

@test:Config
function testNotExistentURL() {
    string nonExistentURL = "https://invalid-url/invalid.pdf";
    string[]|Error actualValue = toImagesFromURL(nonExistentURL);
    validateError(actualValue, "error: The system cannot find the URL specified. Provided: " + nonExistentURL);
    actualValue = toTextFromURL(nonExistentURL);
    validateError(actualValue, "error: The system cannot find the URL specified. Provided: " + nonExistentURL);
}

@test:Config
function testCorruptedPDFFromURL() {
    string corruptedPDFUrl = onlineBaseUrl + "corruptedDoc.pdf";
    string[]|Error actualValue = toImagesFromURL(corruptedPDFUrl);
    validateError(actualValue, "error: Invalid or corrupted PDF file. Provided: " + corruptedPDFUrl);
    actualValue = toTextFromURL(corruptedPDFUrl);
    validateError(actualValue, "error: Invalid or corrupted PDF file. Provided: " + corruptedPDFUrl);
}

@test:Config
function testInvalidDocFromBytes() returns error? {
    string invalidPath = localBaseUrl + "invalidFile.png";
    byte[]|error invalidBytes = io:fileReadBytes(invalidPath);
    if invalidBytes is error {
        test:assertFail("Error while converting file to bytes in testInvalidExtensionFromBytes: " + invalidPath);
    }
    string[]|Error actualValue = toImagesFromBytes(invalidBytes);
    validateError(actualValue, "error: Unsupported file type. Expected .pdf file.");
    actualValue = toTextFromBytes(invalidBytes);
    validateError(actualValue, "error: Unsupported file type. Expected .pdf file.");
}

function validateError(string[]|Error actualValue, string expectedMessage) {
    if actualValue is Error {
        test:assertEquals(actualValue.message(), expectedMessage);
    } else {
        test:assertFail("Expected an error but got a result.");
    }
}
