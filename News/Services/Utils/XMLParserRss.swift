import UIKit

class XMLParserRss: NSObject {
    private enum EFound: String {
        case item
        case url
    }

    // MARK: - Properties

    private let parser: XMLParser
    private var currentElement: RssNews?
    private var foundCharacters: String = ""
    private var currentData: [String: Any] = [:]
    private var parsedData: [RssNewsResponses] = []
    private var parseActive: Bool = false

    // MARK: - Lifecycle

    init(data: Data) {
        parser = XMLParser(data: data)
        super.init()
        parser.delegate = self
        parser.parse()
    }

    // MARK: - Public Method

    func getResult() -> [RssNewsResponses] {
        return parsedData
    }
}

// MARK: - XMLParserDelegate

extension XMLParserRss: XMLParserDelegate {
    func parser(_: XMLParser, didStartElement elementName: String, namespaceURI _: String?, qualifiedName _: String?, attributes attributeDict: [String: String] = [:]) {
        if parseActive, let rssNews = RssNews(rawValue: elementName) {
            switch rssNews {
            case .enclosure:
                if !attributeDict.isEmpty, let url = attributeDict[EFound.url.rawValue] {
                    currentData[RssNews.enclosure.rawValue] = url
                }
            default:
                currentElement = rssNews
            }
        }

        if EFound.item.rawValue == elementName {
            parseActive = true
        }
    }

    func parser(_: XMLParser, foundCharacters string: String) {
        let foundedChar = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if !foundedChar.isEmpty, let element = currentElement {
            switch element {
            case .title, .link, .description, .category:
                currentData[element.rawValue] = foundedChar
            case .pubDate:
                currentData[element.rawValue] = DateUtils
                    .getSecondsFromString(dateString: foundedChar, format: .newsDate)
            default:
                break
            }
        }
    }

    func parser(_: XMLParser, didEndElement elementName: String, namespaceURI _: String?, qualifiedName _: String?) {
        if EFound.item.rawValue == elementName {
            parseActive = false
            if !currentData.isEmpty {
                do {
                    let data = try JSONSerialization.data(withJSONObject: currentData, options: .prettyPrinted)
                    let news = try JSONDecoder().decode(RssNewsResponses.self, from: data)
                    parsedData.append(news)
                } catch {}
                currentData = [:]
            }
        }
    }

    func parserDidEndDocument(_: XMLParser) {
        print("End")
    }

    func parser(_: XMLParser, parseErrorOccurred parseError: Error) {
        print("parseErrorOccurred: \(parseError)")
    }
}
