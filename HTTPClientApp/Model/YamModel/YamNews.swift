import XMLMapper

class YamNews: XMLMappable {
    var nodeName: String!
    
    var title: String!
    var link: String!
    var updated: String!
    var author: String!
    var type: String!
    var summary: YamSummary!
    
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        title <- map["title"]
        link <- map.attributes["link.href"]
        updated <- map["updated"]
        author <- map["author.name"]
        type <- map.attributes[""]
        summary <- map["summary"]
    }
}
