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

import pdf_json_converter.openai;

import ballerina/io;

import thisarug/prettify;
import xlibb/pdfbox;

public function main() returns error? {

    json schema = check io:fileReadJson("./resources/schema.json");
    string documentPath = "./resources/Form.pdf";

    // Convert the PDF into an array of Base64-encoded images.
    io:println("\nConverting the PDF into an array of Base64-encoded images...");
    string[] base64Images = check pdfbox:toImagesFromFile(documentPath);

    // Receiving JSON data from Open AI api and printing the result.
    io:println("\nReceiving JSON data from Open AI api...");
    json data = check openai:getJSON(base64Images, schema.toString());

    io:println("\nResult:");
    io:println(prettify:prettify(data));
}
