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

# The class that corresponds to `org.apache.pdfbox.pdmodel.PDPage`.
# This class represents a single page in a PDF document.
public distinct class PDPage {
    private handle jObj;

    # The init function of the Ballerina class mapping the `PDPage` Java class.
    # + mediaBox - The media box of the page, which defines the boundaries of the page.
    public function init(PDRectangle mediaBox) {
        self.jObj = newPDPage(mediaBox.getHandle());
    }

    function getHandle() returns handle {
        return self.jObj;
    }
}

function newPDPage(handle mediaBox) returns handle = @java:Constructor {
    'class: "org.apache.pdfbox.pdmodel.PDPage",
    paramTypes: ["org.apache.pdfbox.pdmodel.common.PDRectangle"]
} external;
