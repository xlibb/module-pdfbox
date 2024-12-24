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

import xlibb/pdfbox;

public function main() returns error? {

    string resumePath = "./resources/resume.pdf";
    string[]|error textArr = pdfbox:toTextFromFile(resumePath);

    if textArr is error {
        io:println(textArr.message());
        return;
    }

    foreach int i in 0 ..< textArr.length() {
        io:println(string `Text from page ${i + 1}:`);
        io:println(textArr[i]);
    }

}
