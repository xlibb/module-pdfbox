# Convert a PDF file into JSON

## Overview
This guide explains how to extract JSON data from various types of PDF documents, including scanned and embedded files, based on a specified JSON schema. 

## Implementation
The process begins by converting each page of the PDF documents into images using the  **PDFBox** library. Then, these images are sent to the OpenAI API (using ballerina Open AI chat client connector) along with the schema to retrieve the corresponding JSON data.

## Prerequisites

1. Create an open AI API key as described in the [Setup guide](https://central.ballerina.io/ballerinax/openai.chat/latest#setup-guide).
2. In the root directory create a `Config.toml` file and include your API key. Below is an example configuration:

```toml
[pdf_json_converter.openai]
token = "<API key>"
```

## Run the Example

Navigate to the example project directory and execute the following command:

```ballerina 
cd .\examples\pdf_json_converter
bal run
```

> The PDF to be converted is located in the [`/resources/Form.pdf`](./resources/Form.pdf) folder, and the target schema is defined in the [`./resources/schema.json`](./resources/schema.json) file.
