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

const POINTS_PER_INCH = 72;
const POINTS_PER_MM = 1.0 / (10 * 2.54) * POINTS_PER_INCH;

# Enumeration of standard PDF fonts.
public enum PDFont {
    TIMES_ROMAN = "Times-Roman",
    TIMES_BOLD = "Times-Bold",
    TIMES_ITALIC = "Times-Italic",
    TIMES_BOLD_ITALIC = "Times-BoldItalic",
    HELVETICA = "Helvetica",
    HELVETICA_BOLD = "Helvetica-Bold",
    HELVETICA_OBLIQUE = "Helvetica-Oblique",
    HELVETICA_BOLD_OBLIQUE = "Helvetica-BoldOblique",
    COURIER = "Courier",
    COURIER_BOLD = "Courier-Bold",
    COURIER_OBLIQUE = "Courier-Oblique",
    COURIER_BOLD_OBLIQUE = "Courier-BoldOblique",
    SYMBOL = "Symbol",
    ZAPFDINGBATS = "ZapfDingbats"
}
