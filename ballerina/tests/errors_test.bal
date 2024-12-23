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

import ballerina/file;
import ballerina/test;
import ballerina/io;

@test:Config
function testInvalidExtensionFromFile() {
    string invalidPath = file:getCurrentDir() + "/tests/resources/invalidFile.png";
    string[]|Error actualValue = toImagesFromFile(invalidPath);
    validateError(actualValue, "error: Unsupported file type. Expected .pdf file. (" + invalidPath + ")");
    actualValue = toTextFromFile(invalidPath);
    validateError(actualValue, "error: Unsupported file type. Expected .pdf file. (" + invalidPath + ")");
}

@test:Config
function testNonExistentLocalFile() {
    string nonExistentPath = file:getCurrentDir() + "/tests/resources/notExistsDoc.pdf";
    string[]|Error actualValue = toImagesFromFile(nonExistentPath);
    validateError(actualValue, "error: The system cannot find the path specified. (" + nonExistentPath + ")");
    actualValue = toTextFromFile(nonExistentPath);
    validateError(actualValue, "error: The system cannot find the path specified. (" + nonExistentPath + ")");
}

@test:Config
function testCorruptedPDFFromFile() {
    string corruptedPDFPath = file:getCurrentDir() + "/tests/resources/corruptedDoc.pdf";
    string[]|Error actualValue = toImagesFromFile(corruptedPDFPath);
    validateError(actualValue, "error: Invalid or corrupted PDF file. (" + corruptedPDFPath + ")");
    actualValue = toTextFromFile(corruptedPDFPath);
    validateError(actualValue, "error: Invalid or corrupted PDF file. (" + corruptedPDFPath + ")");
}

@test:Config
function testInvalidExtensionFromUrl() {
    string invalidURL = "https://ballerina-ipa.choreoapps.dev/vite.svg";
    string[]|Error actualValue = toImagesFromURL(invalidURL);
    validateError(actualValue, "error: Unsupported file type. Expected .pdf file. (" + invalidURL + ")");
    actualValue = toTextFromURL(invalidURL);
    validateError(actualValue, "error: Unsupported file type. Expected .pdf file. (" + invalidURL + ")");
}

@test:Config
function testNotExistentURL() {
    string nonExistentURL = "https://balna-ipa.choreoapps.dev/invalid.pdf";
    string[]|Error actualValue = toImagesFromURL(nonExistentURL);
    validateError(actualValue, "error: The system cannot find the url specified. (" + nonExistentURL + ")");
    actualValue = toTextFromURL(nonExistentURL);
    validateError(actualValue, "error: The system cannot find the url specified. (" + nonExistentURL + ")");
}

@test:Config
function testCorruptedPDFFromURL() {
    string corruptedPDFUrl = "https://ballerina-ipa.choreoapps.dev/corruptedDoc.pdf";
    string[]|Error actualValue = toImagesFromURL(corruptedPDFUrl);
    validateError(actualValue, "error: Invalid or corrupted PDF file. (" + corruptedPDFUrl + ")");
    actualValue = toTextFromURL(corruptedPDFUrl);
    validateError(actualValue, "error: Invalid or corrupted PDF file. (" + corruptedPDFUrl + ")");
}

@test:Config
function testInvalidDocFromBytes() returns error? {
    string invalidPath = file:getCurrentDir() + "/tests/resources/invalidFile.png";
    byte[]|error invalidBytes = io:fileReadBytes(invalidPath);
    if (invalidBytes is error) {
        test:assertFail("Error while converting file to bytes in testInvalidExtensionFromBytes: " + invalidPath);
    }
    string[]|Error actualValue = toImagesFromBytes(invalidBytes);
    validateError(actualValue, "error: Unsupported file type. Expected .pdf file.");
    actualValue = toTextFromBytes(invalidBytes);
    validateError(actualValue, "error: Unsupported file type. Expected .pdf file.");
}

function validateError(string[]|Error actualValue, string expectedMessage) {
    if (actualValue is Error) {
        test:assertEquals(actualValue.message(), expectedMessage);
    } else {
        test:assertFail("Expected an error but got a result.");
    }
}