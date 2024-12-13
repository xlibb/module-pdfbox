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

import pdf_json_converter.constants;

import ballerinax/openai.chat;

chat:Client chatClient = check new ({
    auth: {
        token: constants:token
    },
    timeout: 120
});

public function getJSON(string[] images, string schema) returns json|error {

    chat:ChatCompletionRequestMessageContentPartImage[] imgContent = [];

    foreach string img in images {
        imgContent.push({"type": "image_url", image_url: {url: "data:image/png;base64," + img}});
    }

    chat:ChatCompletionRequestMessageContentPart[] userContent = [{"type": "text", text: constants:userPrompt + constants:schema}, ...imgContent];
    chat:ChatCompletionRequestMessage systemMessage = {role: "system", content: constants:systemPrompt};
    chat:ChatCompletionRequestMessage userMessage = {role: "user", content: userContent};

    string?|error jsonString = processOpenAIApi(systemMessage, userMessage);

    if jsonString is error {
        return error(jsonString.message());
    } else if jsonString is string {
        return jsonString.fromJsonString();
    }

    return "";

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
