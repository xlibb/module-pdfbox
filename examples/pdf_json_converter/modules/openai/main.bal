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

import ballerinax/openai.chat;

string systemPrompt = "You are an intelligent assistant tasked with analyzing " +
                "text extracted from images of scanned forms using OCR technology. Your goal " +
                "is to understand the content of the form and provide insights as json object " +
                "(as per the provided schema) based on the extracted text. [Important] You will not assume " +
                "any value by your self and always double check the form carefully and confirm each values.";
string userPrompt = string `Give me the json object only for below form images according to the given schema.
                Kindly go through the form carefully. \n\n # Important points \n 1. In some cases forms may use small boxed grids for characters.  
                In such cases the vertical lines of the boxes are intepreted as the digit '1', Please ignore 
                any vertical lines or unrelated artifacts and focus only on the text inside.
                \n 2. If you cannot find the value for a paricular text field mark it as null. \n3. Give the response as plain
                text(json) without code format. \n 4. Enclose the field names with quotoes. \n\n # The schema: `;
configurable string token = ?;

chat:Client chatClient = check new ({
    auth: {
        token: token
    },
    timeout: 120
});

public function getJSON(string[] images, string schema) returns json|error? {

    chat:ChatCompletionRequestMessageContentPartImage[] imgContent = [];

    foreach string img in images {
        imgContent.push({"type": "image_url", image_url: {url: "data:image/png;base64," + img}});
    }

    chat:ChatCompletionRequestMessageContentPart[] userContent = [{"type": "text", text: userPrompt + schema}, ...imgContent];
    chat:ChatCompletionRequestMessage systemMessage = {role: "system", content: systemPrompt};
    chat:ChatCompletionRequestMessage userMessage = {role: "user", content: userContent};

    string?|error jsonString = processOpenAIApi(systemMessage, userMessage);

    if jsonString is error {
        return error(jsonString.message());
    } else if jsonString is string {
        return jsonString.fromJsonString();
    }

}

function processOpenAIApi(chat:ChatCompletionRequestMessage systemMessage,
        chat:ChatCompletionRequestMessage userMessage) returns string?|error {

    chat:CreateChatCompletionResponse|error openAIResponse = chatClient->/chat/completions.post({
        model: "gpt-4o",
        messages: [systemMessage, userMessage]
    });

    if openAIResponse is chat:CreateChatCompletionResponse {
        string? jsonString = openAIResponse.choices[0].message.content;
        return jsonString;
    } else {
        return error("Failed to connect to the open ai api. " + openAIResponse.message());
    }
}
