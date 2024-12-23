import ballerina/io;
import xlibb/pdfbox;

public function main() returns error? {

    string resumePath = "./resources/resume.pdf";
    string[]|error textArr = pdfbox:toTextFromFile(resumePath);

    if textArr is error {
        io:println(textArr.message());
        return;
    }

    foreach int i in 0..<textArr.length() {
        io:println(string `Text from page ${i + 1}:`);
        io:println(textArr[i]);
    }

}
