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
import ballerina/io;
import ballerina/test;

@test:Config
function testToImagesFromFile() returns error? {
    string[] actualValue = check toImagesFromFile(file:getCurrentDir() + "/tests/resources/test.pdf");
    string[] expectedValue = check io:fileReadLines(file:getCurrentDir() + "/tests/resources/base64.txt");
    test:assertEquals(actualValue.length(), 1);
    test:assertEquals(actualValue[0], expectedValue[0]);
}

@test:Config
function testToImagesFromURL() returns error? {
    string[] actualValue = check toImagesFromURL("https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf");
    string[] expectedValue = check io:fileReadLines(file:getCurrentDir() + "/tests/resources/base64.txt");
    test:assertEquals(actualValue.length(), 1);
    test:assertEquals(actualValue[0], expectedValue[0]);
}

@test:Config
function testToImagesFromBytes() returns error? {
    byte[] bytes = check io:fileReadBytes(file:getCurrentDir() + "/tests/resources/test.pdf");
    string[] actualValue = check toImagesFromBytes(bytes);
    string[] expectedValue = check io:fileReadLines(file:getCurrentDir() + "/tests/resources/base64.txt");
    test:assertEquals(actualValue.length(), 1);
    test:assertEquals(actualValue[0], expectedValue[0]);
}

@test:Config
function testToTextFromFile() returns error? {
    string[] actualValue = check toTextFromFile(file:getCurrentDir() + "/tests/resources/test.pdf");
    string[] expectedValue = ["Dummy PDF file\r\n"];
    test:assertEquals(actualValue.length(), 1);
    test:assertEquals(actualValue[0], expectedValue[0]);
}

@test:Config
function testToTextFromURL() returns error? {
    string[] actualValue = check toTextFromURL("https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf");
    string[] expectedValue = ["Dummy PDF file\r\n"];
    test:assertEquals(actualValue.length(), 1);
    test:assertEquals(actualValue[0], expectedValue[0]);
}

@test:Config
function testToTextFromBytes() returns error? {
    byte[] bytes = check io:fileReadBytes(file:getCurrentDir() + "/tests/resources/test.pdf");
    string[] actualValue = check toTextFromBytes(bytes);
    string[] expectedValue = ["Dummy PDF file\r\n"];
    test:assertEquals(actualValue.length(), 1);
    test:assertEquals(actualValue[0], expectedValue[0]);
}
