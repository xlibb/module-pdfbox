// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).

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

# The class that coresponds to org.apache.pdfbox.pdmodel.PDDocument.
# This is the in-memory representation of a PDF document.
public distinct class PDDocument {
    private handle jObj;

    # The init function of the Ballerina class mapping the PDDocument Java class.
    public function init() {
        self.jObj = newPDDocument();
    }

    function getHandle() returns handle {
        return self.jObj;
    }

    # Adds a page to the document.
    # + page - The page to be added.
    public function addPage(PDPage page) {
        addPage(self.jObj, page.getHandle());
    }

    # Removes a page from the document.
    # + pageIndex - The index of the page to be removed.
    public function removePage(int pageIndex) {
        removePage(self.jObj, pageIndex);
    }

    # Saves the document to a file.
    # + filePath - The path where the document should be saved.
    # + return - Returns an error if the save not is successful.
    public function save(string filePath) returns Error? {
        // convert string to Java String
        error? externalObj = save(self.jObj, java:fromString(filePath));
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Gets the page in a given index.
    # + pageIndex - The index of the page to be retrieved.
    # + return - The number of pages in the document.
    public function getPage(int pageIndex) returns handle {
        return getPage(self.jObj, pageIndex);
    }

    # Closes the document and releases any resources associated with it.
    # + return - Returns an error if the close not is successful.
    public function close() returns Error? {
        error? externalObj = closePDDocument(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }
}

function newPDDocument() returns handle = @java:Constructor {
    'class: "org.apache.pdfbox.pdmodel.PDDocument"
} external;

function addPage(handle jObj, handle page) = @java:Method {
    'class: "org.apache.pdfbox.pdmodel.PDDocument",
    paramTypes: ["org.apache.pdfbox.pdmodel.PDPage"]
} external;

function removePage(handle jObj, int pageIndex) = @java:Method {
    'class: "org.apache.pdfbox.pdmodel.PDDocument",
    paramTypes: ["int"]
} external;

function save(handle jObj, handle filePath) returns error? = @java:Method {
    'class: "org.apache.pdfbox.pdmodel.PDDocument",
    paramTypes: ["java.lang.String"]
} external;

function getPage(handle jObj, int pageIndex) returns handle = @java:Method {
    'class: "org.apache.pdfbox.pdmodel.PDDocument",
    paramTypes: ["int"]
} external;

function closePDDocument(handle jObj) returns error? = @java:Method {
    'class: "org.apache.pdfbox.pdmodel.PDDocument",
    name: "close"
} external;
