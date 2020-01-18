import Foundation
import XMLMapper

class YamFeed: XMLMappable {
    var nodeName: String!
    
    var title: String?
    var link: String?
    var updated: Date?
    var entries: [YamNews]!
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        title <- map["title"]
        link <- map.attributes["link.href"]
        updated <- map["updated"]
        entries <- map["entry"]
    }
}
