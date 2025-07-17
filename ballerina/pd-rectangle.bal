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

# The class that corresponds to `org.apache.pdfbox.pdmodel.common.PDRectangle`.
# A rectangle in a PDF document.
public distinct class PDRectangle {
    private handle jObj;

    # The init function of the Ballerina class mapping the PDRectangle Java class.
    # + width - The width of the rectangle.
    # + height - The height of the rectangle.
    public function init(float width, float height) {
        self.jObj = newPDRectangle(width, height);
    }

    function getHandle() returns handle {
        return self.jObj;
    }
}

# A rectangle the size of U.S. Letter, 8.5" x 11".
public PDRectangle PD_RECT_LETTER = new(8.5 * POINTS_PER_INCH, 11.0 * POINTS_PER_INCH);

# A rectangle the size of U.S. Tabloid, 11" x 17".
public PDRectangle PD_RECT_TABLIOD = new(11.0 * POINTS_PER_INCH, 17.0 * POINTS_PER_INCH);

# A rectangle the size of U.S. Legal, 8.5" x 14".
public PDRectangle PD_RECT_LEGAL = new(8.5 * POINTS_PER_INCH, 14.0 * POINTS_PER_INCH);

# A rectangle the size of A0 Paper.
public PDRectangle PD_RECT_A0 = new(841 * POINTS_PER_MM, 1189 * POINTS_PER_MM);

# A rectangle the size of A1 Paper.
public PDRectangle PD_RECT_A1 = new(594 * POINTS_PER_MM, 841 * POINTS_PER_MM);

# A rectangle the size of A2 Paper.
public PDRectangle PD_RECT_A2 = new(420 * POINTS_PER_MM, 594 * POINTS_PER_MM);

# A rectangle the size of A3 Paper.
public PDRectangle PD_RECT_A3 = new(297 * POINTS_PER_MM, 420 * POINTS_PER_MM);

# A rectangle the size of A4 Paper.
public PDRectangle PD_RECT_A4 = new(210 * POINTS_PER_MM, 297 * POINTS_PER_MM);

# A rectangle the size of A5 Paper.
public PDRectangle PD_RECT_A5 = new(148 * POINTS_PER_MM, 210 * POINTS_PER_MM);

# A rectangle the size of A6 Paper.
public PDRectangle PD_RECT_A6 = new(105 * POINTS_PER_MM, 148 * POINTS_PER_MM);

function newPDRectangle(float width, float height) returns handle = @java:Constructor {
    'class: "org.apache.pdfbox.pdmodel.common.PDRectangle",
    paramTypes: ["float", "float"]
} external;
