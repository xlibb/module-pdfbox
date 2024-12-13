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

public configurable string token = ?;
public string path = "./resources/Form.pdf";
public string openaiURL = "https://api.openai.com/v1";
public string systemPrompt = "You are an intelligent assistant tasked with analyzing " +
                "text extracted from images of scanned forms using OCR technology. Your goal " +
                "is to understand the content of the form and provide insights as json object " +
                "(as per the provided schema) based on the extracted text. [Important] You will not assume any value by your self and always double check the form carefully and confirm each values.";
public string userPrompt = string `Give me the json object only for below form images according to the given schema.
                Kindly go through the form carefully. \n\n # Important points \n 1. In some cases forms may use small boxed grids for characters.  
                In such cases the vertical lines of the boxes are intepreted as the digit '1', Please ignore any vertical lines or unrelated artifacts and focus only on the text inside.
                \n 2. If you cannot find the value for a paricular text field mark it as null. \n3. Give the response as plain
                text(json) without code format. \n 4. Enclose the field names with quotoes. \n\n # The schema: `;
public string schema = string `{
    "type": "object",
    "properties": {
        "fullName": {"type": "string"},
        "nameWithInitials": {"type": "string"},
        "dob": {"type": "string", "description": "format of the date is YYYY-MM-DD"},
        "age": {"type": "string"},
        "nationality": {"type": "string"},
        "gender": {"type": "string", "enum": ["male", "female"]},
        "address": {"type": "string"},
        "mobile": {"type": "string"},
        "district": {"type": "string"},
        "gramaSevaka": {"type": "string"},
        "nic": {"type": "string"},
        "passport": {"type": "string"},
        "emergency": {
            "type": "object",
            "properties": {
                "name": {"type": "string"},
                "address": {"type": "string"},
                "mobile": {"type": "string"},
                "relationship": {"type": "string"},
                "email": {"type": "string"}
            }
        },
        "olResults": {
            "type": "object",
            "properties": {
                "school": {"type": "string"},
                "year": {"type": "string"},
                "index": {"type": "string"},
                "results": {
                    "type": "array",
                    "items": {
                        "type": "object",
                        "properties": {
                            "subject": {"type": "string"},
                            "grade": {"type": "string"}
                        }
                    }
                }
            }
        },
        "alResults": {
            "type": "object",
            "properties": {
                "school": {"type": "string"},
                "year": {"type": "string"},
                "index": {"type": "string"},
                "zScore": {"type": "string"},
                "results": {
                    "type": "array",
                    "items": {
                        "type": "object",
                        "properties": {
                            "subject": {"type": "string"},
                            "grade": {"type": "string"}
                        }
                    }
                }
            }
        },
        "otherQualifications": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "course": {"type": "string"},
                    "nvqLevel": {"type": "string"},
                    "institute": {"type": "string"},
                    "year": {"type": "string"},
                    "result": {"type": "string"}
                }
            }
        },
        "extraCurricularActivities": {"type": "string"},
        "refrees": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "name": {"type": "string"},
                    "designation": {"type": "string"},
                    "address": {"type": "string"},
                    "mobile": {"type": "string"}
                }
            }
        }
    }
}`;
