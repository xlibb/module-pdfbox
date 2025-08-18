## Overview

The Ballerina PDFBox module provides comprehensive APIs for PDF document processing, offering efficient solutions for converting PDF documents into images and extracting text content. This module enables PDF manipulation within Ballerina applications, supporting various input sources including file paths, URLs, and byte arrays.

## Quick Start

Get started with the PDFBox module by following these simple steps to process your first PDF document.

### Converting PDF documents to images

```ballerina
import xlibb/pdfbox;

public function main() returns error? {
    // Convert PDF from file path
    string[] imagesFromFile = check pdfbox:toImagesFromFile("C://path/to/file/myfile.pdf");
    
    // Convert PDF from URL
    string[] imagesFromURL = check pdfbox:toImagesFromURL("https://url/to/file/myfile.pdf");
    
    // Convert PDF from byte array
    string[] imagesFromBytes = check pdfbox:toImagesFromBytes([your, byte, array]);
}
```

### Extracting text from PDF documents

```ballerina
import xlibb/pdfbox;

public function main() returns error? {
    // Extract text from file path
    string textFromFile = check pdfbox:toTextFromFile("C://path/to/file/myfile.pdf");
    
    // Extract text from URL
    string textFromURL = check pdfbox:toTextFromURL("https://url/to/file/myfile.pdf");
    
    // Extract text from byte array
    string textFromBytes = check pdfbox:toTextFromBytes([your, byte, array]);
}
```

## Examples

The `pdfbox` library provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/xlibb/module-pdfbox/tree/main/examples/), covering the following use cases:

1. [PDF to text](https://github.com/xlibb/module-pdfbox/tree/main/examples/pdf_to_text).

2. [PDF-JSON Converter](https://github.com/xlibb/module-pdfbox/tree/main/examples/pdf_json_converter). 
