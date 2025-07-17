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
import ballerina/jballerina.java.arrays as jarrays;

# The class that corresponds to `org.apache.pdfbox.pdmodel.PDPageContentStream`.
# This class is used to create and modify the content of a PDF page.
public distinct class PDPageContentStream {
    private handle jObj;

    # The init function of the Ballerina class mapping the `PDPageContentStream` Java class.
    # + document - The `PDDocument` object representing the PDF document.
    # + page - The `PDPage` object representing the page to which content will be added.
    public function init(PDDocument document, PDPage page) returns Error? {
        error|handle externalObj = newPDPageContentStream(document.getHandle(), page.getHandle());
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
        self.jObj = externalObj;
    }

    function getHandle() returns handle {
        return self.jObj;
    }

    # Write a comment line.
    #
    # + comment - the comment to be added to the content stream.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function addComment(string comment) returns Error? {
        error|() externalObj = addComment(self.jObj, java:fromString(comment));
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Add a rectangle to the current path.
    #
    # + x - The lower left x coordinate.
    # + y - The lower left y coordinate.
    # + width - The width of the rectangle.
    # + height - The height of the rectangle.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function addRect(float x, float y, float width, float height) returns Error? {
        error|() externalObj = addRect(self.jObj, x, y, width, height);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Begin some text operations.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function beginText() returns Error? {
        error|() externalObj = beginText(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # End some text operations.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function endText() returns Error? {
        error|() externalObj = endText(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Intersects the current clipping path with the current path, using the nonzero rule.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function clip() returns Error? {
        error|() externalObj = clip(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Intersects the current clipping path with the current path, using the even-odd rule.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function clipEvenOdd() returns Error? {
        error|() externalObj = clipEvenOdd(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Close the content stream.  This must be called when you are done with this object.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function close() returns Error? {
        error|() externalObj = closePDPageContentStream(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Close, fill, and then stroke the path, using the nonzero winding number rule to determine the region to fill.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function closeAndFillAndStroke() returns Error? {
        error|() externalObj = closeAndFillAndStroke(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Close, fill, and then stroke the path, using the even-odd rule to determine the region to fill.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function closeAndFillAndStrokeEvenOdd() returns Error? {
        error|() externalObj = closeAndFillAndStrokeEvenOdd(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Close and stroke the path.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function closeAndStroke() returns Error? {
        error|() externalObj = closeAndStroke(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Closes the current subpath.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function closePath() returns Error? {
        error|() externalObj = closePath(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Append a cubic Bézier curve to the current path. The curve extends from the current point to the point (x3, y3), 
    # using (x1, y1) and (x2, y2) as the Bézier control points.
    #
    # + x1 - x coordinate of the point 1
    # + y1 - y coordinate of the point 1
    # + x2 - x coordinate of the point 2
    # + y2 - y coordinate of the point 2
    # + x3 - x coordinate of the point 3
    # + y3 - y coordinate of the point 3
    # + return - `javaio:IOException` if the content stream could not be written.
    public function curveTo(float x1, float y1, float x2, float y2, float x3, float y3) returns Error? {
        error|() externalObj = curveTo(self.jObj, x1, y1, x2, y2, x3, y3);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Append a cubic Bézier curve to the current path. The curve extends from the current point to the point (x3, y3), 
    # using (x1, y1) and (x3, y3) as the Bézier control points.
    #
    # + x1 - x coordinate of the point 1
    # + y1 - y coordinate of the point 1
    # + x3 - x coordinate of the point 3
    # + y3 - y coordinate of the point 3
    # + return - `javaio:IOException` if the content stream could not be written.
    public function curveTo1(float x1, float y1, float x3, float y3) returns Error? {
        error|() externalObj = curveTo1(self.jObj, x1, y1, x3, y3);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Append a cubic Bézier curve to the current path. The curve extends from the current point to the point (x3, y3), 
    # using the current point and (x2, y2) as the Bézier control points.
    #
    # + x2 - The `float` value required to map with the Java method parameter.
    # + y2 - The `float` value required to map with the Java method parameter.
    # + x3 - The `float` value required to map with the Java method parameter.
    # + y3 - The `float` value required to map with the Java method parameter.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function curveTo2(float x2, float y2, float x3, float y3) returns Error? {
        error|() externalObj = curveTo2(self.jObj, x2, y2, x3, y3);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Fills the path using the nonzero winding number rule.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function fill() returns Error? {
        error|() externalObj = fill(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Fill and then stroke the path, using the nonzero winding number rule to determine the region to fill. 
    # This shall produce the same result as constructing two identical path objects, painting the first with `fill()` 
    # and the second with `stroke()`.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function fillAndStroke() returns Error? {
        error|() externalObj = fillAndStroke(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Fill and then stroke the path, using the even-odd rule to determine the region to fill. This shall produce the 
    # same result as constructing two identical path objects, painting the first with `fillEvenOdd()` 
    # and the second with `stroke()`.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function fillAndStrokeEvenOdd() returns Error? {
        error|() externalObj = fillAndStrokeEvenOdd(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Fills the path using the even-odd winding rule.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function fillEvenOdd() returns Error? {
        error|() externalObj = fillEvenOdd(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Draw a line from the current position to the given coordinates.
    #
    # + x - The x coordinate.
    # + y - The y coordinate.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function lineTo(float x, float y) returns Error? {
        error|() externalObj = lineTo(self.jObj, x, y);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Move the current position to the given coordinates.
    #
    # + x - The x coordinate.
    # + y - y The y coordinate.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function moveTo(float x, float y) returns Error? {
        error|() externalObj = moveTo(self.jObj, x, y);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Move to the start of the next line of text. Requires the leading `setLeading` to have been set.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function newLine() returns Error? {
        error|() externalObj = newLine(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # The Td operator. Move to the start of the next line, offset from the start of the current line by (tx, ty).
    #
    # + tx - The x translation.
    # + ty - The y translation.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function newLineAtOffset(float tx, float ty) returns Error? {
        error|() externalObj = newLineAtOffset(self.jObj, tx, ty);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the character spacing. The value shall be added to the horizontal or vertical component of the glyph's 
    # displacement, depending on the writing mode.
    #
    # + spacing - character spacing
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setCharacterSpacing(float spacing) returns Error? {
        error|() externalObj = setCharacterSpacing(self.jObj, spacing);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the font and font size to draw text with.
    #
    # + font - The font to use.
    # + fontSize - The font size to draw the text.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setFont(PDFont font, float fontSize) returns Error? {
        error|() externalObj = setFont(self.jObj, getFont(java:fromString(font)), fontSize);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the horizontal scaling to scale / 100.
    #
    # + scale - number specifying the percentage of the normal width. Default value: 100 (normal width).
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setHorizontalScaling(float scale) returns Error? {
        error|() externalObj = setHorizontalScaling(self.jObj, scale);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Sets the text leading.
    #
    # + leading - The leading in unscaled text units.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setLeading(float leading) returns Error? {
        error|() externalObj = setLeading(self.jObj, leading);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the line cap style.
    #
    # + lineCapStyle - 0 for butt cap, 1 for round cap, and 2 for projecting square cap.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setLineCapStyle(int lineCapStyle) returns Error? {
        error|() externalObj = setLineCapStyle(self.jObj, lineCapStyle);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the line dash pattern.
    #
    # + pattern - The pattern array
    # + phase - The phase of the pattern
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setLineDashPattern(float[] pattern, float phase) returns Error?|error? {
        error|() externalObj = setLineDashPattern(self.jObj, check jarrays:toHandle(pattern, "float"), phase);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the line join style.
    #
    # + lineJoinStyle - 0 for miter join, 1 for round join, and 2 for bevel join.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setLineJoinStyle(int lineJoinStyle) returns Error? {
        error|() externalObj = setLineJoinStyle(self.jObj, lineJoinStyle);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set line width to the given value.
    #
    # + lineWidth - The width which is used for drawing.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setLineWidth(float lineWidth) returns Error? {
        error|() externalObj = setLineWidth(self.jObj, lineWidth);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the miter limit.
    #
    # + miterLimit - the new miter limit.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setMiterLimit(float miterLimit) returns Error? {
        error|() externalObj = setMiterLimit(self.jObj, miterLimit);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the stroking color in the DeviceGray color space. Range is 0..1.
    #
    # + g - The gray value.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setNonStrokingColorDeviceGray(float g) returns Error? {
        error|() externalObj = setNonStrokingColorDeviceGray(self.jObj, g);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the non-stroking color in the DeviceRGB color space. Range is 0..1.
    #
    # + r - The red value.
    # + g - The green value.
    # + b - The green value.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setNonStrokingColorRGB(float r, float g, float b) returns Error? {
        error|() externalObj = setNonStrokingColorRGB(self.jObj, r, g, b);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the non-stroking color in the DeviceCMYK color space. Range is 0..1.
    #
    # + c - The cyan value.
    # + m - The magenta value.
    # + y - The yellow value.
    # + k - The black value.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setNonStrokingColorCMYK(float c, float m, float y, float k) returns Error? {
        error|() externalObj = setNonStrokingColorCMYK(self.jObj, c, m, y, k);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the stroking color in the DeviceGray color space. Range is 0..1.
    #
    # + g - The gray value.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setStrokingColorDeviceGray(float g) returns Error? {
        error|() externalObj = setStrokingColorDeviceGray(self.jObj, g);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the stroking color in the DeviceRGB color space. Range is 0..1.
    #
    # + r - The red value
    # + g - The green value.
    # + b - The blue value.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setStrokingColorRGB(float r, float g, float b) returns Error? {
        error|() externalObj = setStrokingColorRGB(self.jObj, r, g, b);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the stroking color in the DeviceCMYK color space. Range is 0..1
    #
    # + c - The cyan value.
    # + m - The magenta value.
    # + y - The yellow value.
    # + k - The black value.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setStrokingColorCMYK(float c, float m, float y, float k) returns Error? {
        error|() externalObj = setStrokingColorCMYK(self.jObj, c, m, y, k);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the text rise value, i.e. move the baseline up or down. This is useful for drawing superscripts or subscripts.
    #
    # + rise - Specifies the distance, in unscaled text space units, to move the baseline up or down from its default 
    # location. 0 restores the default location.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setTextRise(float rise) returns Error? {
        error|() externalObj = setTextRise(self.jObj, rise);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Set the word spacing. The value shall be added to the horizontal or vertical component of the ASCII SPACE 
    # character, depending on the writing mode.
    #
    # + spacing - word spacing
    # + return - `javaio:IOException` if the content stream could not be written.
    public function setWordSpacing(float spacing) returns Error? {
        error|() externalObj = setWordSpacing(self.jObj, spacing);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Shows the given text at the location specified by the current text matrix.
    #
    # + text - The Unicode text to show.
    # + return - `javaio:IOException` if the content stream could not be written.
    public function showText(string text) returns Error? {
        error|() externalObj = showText(self.jObj, java:fromString(text));
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }

    # Stroke the path.
    #
    # + return - `javaio:IOException` if the content stream could not be written.
    public function stroke() returns Error? {
        error|() externalObj = stroke(self.jObj);
        if externalObj is error {
            return error(externalObj.message(), externalObj);
        }
    }
}

function newPDPageContentStream(handle document, handle page) returns handle|error = @java:Constructor {
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["org.apache.pdfbox.pdmodel.PDDocument", "org.apache.pdfbox.pdmodel.PDPage"]
} external;

function addComment(handle receiver, handle comment) returns error? = @java:Method {
    name: "addComment",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["java.lang.String"]
} external;

function addRect(handle receiver, float x, float y, float width, float height) returns error? = @java:Method {
    name: "addRect",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float", "float", "float"]
} external;

function beginText(handle receiver) returns error? = @java:Method {
    name: "beginText",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function clip(handle receiver) returns error? = @java:Method {
    name: "clip",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function clipEvenOdd(handle receiver) returns error? = @java:Method {
    name: "clipEvenOdd",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function closePDPageContentStream(handle receiver) returns error? = @java:Method {
    name: "close",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function closeAndFillAndStroke(handle receiver) returns error? = @java:Method {
    name: "closeAndFillAndStroke",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function closeAndFillAndStrokeEvenOdd(handle receiver) returns error? = @java:Method {
    name: "closeAndFillAndStrokeEvenOdd",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function closeAndStroke(handle receiver) returns error? = @java:Method {
    name: "closeAndStroke",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function closePath(handle receiver) returns error? = @java:Method {
    name: "closePath",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function curveTo(handle receiver, float x1, float y1, float x2, float y2, float x3, float y3) returns error? = @java:Method {
    name: "curveTo",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float", "float", "float", "float", "float"]
} external;

function curveTo1(handle receiver, float x1, float y1, float x3, float y3) returns error? = @java:Method {
    name: "curveTo1",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float", "float", "float"]
} external;

function curveTo2(handle receiver, float x2, float y2, float x3, float y3) returns error? = @java:Method {
    name: "curveTo2",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float", "float", "float"]
} external;

function endText(handle receiver) returns error? = @java:Method {
    name: "endText",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function fill(handle receiver) returns error? = @java:Method {
    name: "fill",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function fillAndStroke(handle receiver) returns error? = @java:Method {
    name: "fillAndStroke",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function fillAndStrokeEvenOdd(handle receiver) returns error? = @java:Method {
    name: "fillAndStrokeEvenOdd",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function fillEvenOdd(handle receiver) returns error? = @java:Method {
    name: "fillEvenOdd",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function lineTo(handle receiver, float x, float y) returns error? = @java:Method {
    name: "lineTo",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float"]
} external;

function moveTo(handle receiver, float x, float y) returns error? = @java:Method {
    name: "moveTo",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float"]
} external;

function newLine(handle receiver) returns error? = @java:Method {
    name: "newLine",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function newLineAtOffset(handle receiver, float tx, float ty) returns error? = @java:Method {
    name: "newLineAtOffset",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float"]
} external;

function setCharacterSpacing(handle receiver, float spacing) returns error? = @java:Method {
    name: "setCharacterSpacing",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function setFont(handle receiver, handle font, float fontSize) returns error? = @java:Method {
    name: "setFont",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["org.apache.pdfbox.pdmodel.font.PDFont", "float"]
} external;

function setHorizontalScaling(handle receiver, float scale) returns error? = @java:Method {
    name: "setHorizontalScaling",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function setLeading(handle receiver, float leading) returns error? = @java:Method {
    name: "setLeading",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function setLineCapStyle(handle receiver, int lineCapStyle) returns error? = @java:Method {
    name: "setLineCapStyle",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["int"]
} external;

function setLineDashPattern(handle receiver, handle pattern, float phase) returns error? = @java:Method {
    name: "setLineDashPattern",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["[F", "float"]
} external;

function setLineJoinStyle(handle receiver, int lineJoinStyle) returns error? = @java:Method {
    name: "setLineJoinStyle",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["int"]
} external;

function setLineWidth(handle receiver, float lineWidth) returns error? = @java:Method {
    name: "setLineWidth",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function setMiterLimit(handle receiver, float miterLimit) returns error? = @java:Method {
    name: "setMiterLimit",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function setNonStrokingColorDeviceGray(handle receiver, float g) returns error? = @java:Method {
    name: "setNonStrokingColor",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function setNonStrokingColorRGB(handle receiver, float r, float g, float b) returns error? = @java:Method {
    name: "setNonStrokingColor",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float", "float"]
} external;

function setNonStrokingColorCMYK(handle receiver, float c, float m, float y, float k) returns error? = @java:Method {
    name: "setNonStrokingColor",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float", "float", "float"]
} external;

function setStrokingColorDeviceGray(handle receiver, float g) returns error? = @java:Method {
    name: "setStrokingColor",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function setStrokingColorRGB(handle receiver, float r, float g, float b) returns error? = @java:Method {
    name: "setStrokingColor",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float", "float"]
} external;

function setStrokingColorCMYK(handle receiver, float c, float m, float y, float k) returns error? = @java:Method {
    name: "setStrokingColor",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float", "float", "float", "float"]
} external;

function setTextRise(handle receiver, float rise) returns error? = @java:Method {
    name: "setTextRise",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function setWordSpacing(handle receiver, float spacing) returns error? = @java:Method {
    name: "setWordSpacing",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["float"]
} external;

function showText(handle receiver, handle text) returns error? = @java:Method {
    name: "showText",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: ["java.lang.String"]
} external;

function stroke(handle receiver) returns error? = @java:Method {
    name: "stroke",
    'class: "org.apache.pdfbox.pdmodel.PDPageContentStream",
    paramTypes: []
} external;

function getFont(handle fontName) returns handle = @java:Method {
    name: "getFont",
    'class: "io.xlibb.pdfbox.utils.Utils",
    paramTypes: ["java.lang.String"]
} external;
