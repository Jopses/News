import XCTest
@testable import News

class XMLParserRssTests: XCTestCase {
    func testXMLParserRss() {
        var output: [[RssNewsResponses]] = []
        for index in 1 ... 5 {
            if let file = Bundle(for: type(of: self)).path(forResource: "XMLTest\(index)", ofType: "xml") {
                do {
                    let string = try String(contentsOfFile: file, encoding: String.Encoding.utf8)
                    let data = Data(string.utf8)
                    let xml = XMLParserRss(data: data).getResult()
                    output.append(xml)
                } catch {}
            }
        }
        let testData = XMLParserRssTestsData()
        let expectedOutput = testData.output
        XCTAssertEqual(output, expectedOutput)
    }
}
