## Overview

This module offers two core APIs: one for converting PDF documents into images and another for extracting text from PDF documents, providing efficient and versatile solutions for PDF processing.

## Usage

#### Converting PDF documents into images

```
import xlibb/pdfbox;

public function main() returns error? {

    // Convert the PDF located at a file path into an array of Base64-encoded images.
    string[] base64ImagesForFilePath = check pdfbox:toImagesFromFile("C://path/to/file/myfile.pdf");

    // Convert the PDF available at a URL into an array of Base64-encoded images.
    string[] base64ImagesForURL = check pdfbox:toImagesFromURL("https://url/to/file/myfile.pdf");

    // Convert the PDF represented as a byte array into an array of Base64-encoded images.
    string[] base64ImagesForByteArr = check pdfbox:toImagesFromBytes([your, byte, array]);
}
```

#### Extracting text from PDF documents

```
import xlibb/pdfbox;

public function main() returns error? {

    // Extract text from the PDF located at a file path.
    string[] base64ImagesForFilePath = check pdfbox:toTextFromFile("C://path/to/file/myfile.pdf");

    // Extract text from the PDF available at a URL.
    string[] base64ImagesForURL = check pdfbox:toTextFromURL("https://url/to/file/myfile.pdf");

    // Extract text from the PDF represented as a byte array.
    string[] base64ImagesForByteArr = check pdfbox:toTextFromBytes([your, byte, array]);
}
```

## Examples

The `pdfbox` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/xlibb/module-pdfbox/tree/main/examples/), covering the following use cases:

[//]: # (TODO: Add examples)

1. [PDF-JSON Converter](https://github.com/xlibb/module-pdfbox/tree/main/examples/pdf_json_converter). 
