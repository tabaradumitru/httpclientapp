import XMLMapper

class NYTimesNews: XMLMappable {
    var nodeName: String!
    
    var title: String!
    var link: String!
    var updated: String!
    var author: String!
    var summary: String!
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        title <- map["title"]
        link <- map["link"]
        updated <- map["pubDate"]
        author <- map["author"]
        summary <- map["description"]
    }
}
