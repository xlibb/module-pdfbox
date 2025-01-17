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

type TestCase record {
    string path;
    string url;
    string[] expectedBase64;
    string[] expectedText;
};

@test:Config {
    dataProvider: TestCaseProvider
}
function testToImagesFromFile(TestCase testCase) returns error? {
    string[]|Error actualValue = toImagesFromFile(testCase.path);
    validateToImageResults(actualValue, testCase.expectedBase64, "testToImagesFromFile");
}

@test:Config {
    dataProvider: TestCaseProvider
}
function testToImagesFromURL(TestCase testCase) returns error? {
    string[]|Error actualValue = toImagesFromURL(testCase.url);
    validateToImageResults(actualValue, testCase.expectedBase64, "testToImagesFromURL");
}

@test:Config {
    dataProvider: TestCaseProvider
}
function testToImagesFromSinglePageBytes(TestCase testCase) returns error? {
    byte[]|error bytes = io:fileReadBytes(testCase.path);
    if bytes is error {
        test:assertFail("Error while converting file to bytes: " + testCase.path);
    }
    string[]|Error actualValue = toImagesFromBytes(bytes);
    validateToImageResults(actualValue, testCase.expectedBase64, "testToImagesFromSinglePageBytes");
}

@test:Config {
    dataProvider: TestCaseProvider
}
function testToTextFromFile(TestCase testCase) returns error? {
    string[]|Error actualValue = toTextFromFile(testCase.path);
    validateToTextResults(actualValue, testCase.expectedText, "testToTextFromFile");
}

@test:Config {
    dataProvider: TestCaseProvider
}
function testToTextFromURL(TestCase testCase) returns error? {
    string[]|Error actualValue = toTextFromURL(testCase.url);
    validateToTextResults(actualValue, testCase.expectedText, "testToTextFromURL");
}

@test:Config {
    dataProvider: TestCaseProvider
}
function testToTextFromBytes(TestCase testCase) returns error? {
    byte[]|error bytes = io:fileReadBytes(testCase.path);
    if bytes is error {
        test:assertFail("Error while converting file to bytes: " + testCase.path);
    }
    string[]|Error actualValue = toTextFromBytes(bytes);
    validateToTextResults(actualValue, testCase.expectedText, "testToTextFromBytes");
}

function validateToImageResults(string[]|Error actualValue, string[] expectedValue, string testName) {
    if actualValue is Error {
        test:assertFail("Expected result but got an error: " + testName);
    }
    test:assertEquals(actualValue.length(), expectedValue.length(), msg = testName + ": Mismatch in array length");
    foreach int i in 0 ..< expectedValue.length() {
        test:assertEquals(actualValue[i], expectedValue[i], msg = testName + ": Mismatch in value at index " + i.toString());
    }
}

function validateToTextResults(string[]|Error actualValue, string[] expectedValue, string testName) {
    if actualValue is Error {
        test:assertFail("Expected result but got an error: " + testName);
    }
    test:assertEquals(actualValue.length(), expectedValue.length(), msg = testName + ": Mismatch in array length");
    foreach int i in 0 ..< expectedValue.length() {
        string expected = actualValue[i].endsWith("\r\n") ? expectedValue[i] + "\r\n" : expectedValue[i] + "\n";
        test:assertEquals(actualValue[i], expected, msg = testName + ": Mismatch in value at index " + i.toString());
    }
}

function TestCaseProvider() returns TestCase[][]|error {
    TestCase singlePageTest = {
        path: file:getCurrentDir() + "/tests/resources/singlePageDoc.pdf",
        url: "https://ipa-usecase-2-demo-frontend.vercel.app/test1.pdf",
        expectedBase64: check io:fileReadLines(file:getCurrentDir() + "/tests/resources/singlePageDocBase64.txt"),
        expectedText: ["Page 1"]
    };

    TestCase multiPageTest = {
        path: file:getCurrentDir() + "/tests/resources/multiPageDoc.pdf",
        url: "https://ipa-usecase-2-demo-frontend.vercel.app/test2.pdf",
        expectedBase64: check io:fileReadLines(file:getCurrentDir() + "/tests/resources/multiPageDocBase64.txt"),
        expectedText: ["PAGE 1", "PAGE 2"]
    };

    TestCase docWithImageTest = {
        path: file:getCurrentDir() + "/tests/resources/docWithImage.pdf",
        url: "https://ipa-usecase-2-demo-frontend.vercel.app/test3.pdf",
        expectedBase64: check io:fileReadLines(file:getCurrentDir() + "/tests/resources/docWithImageBase64.txt"),
        expectedText: ["Ballerina Lang"]
    };

    return [[singlePageTest], [multiPageTest], [docWithImageTest]];
}
