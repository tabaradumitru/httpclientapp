import XMLMapper

class NYTimesFeed: XMLMappable {
    var nodeName: String!
    
    var title: String?
    var link: String?
    var description: String?
    var copyright: String?
    var entries: [NYTimesNews]!
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        title <- map["channel.ttl"]
        link <- map["channel.link"]
        description <- map["channel.description"]
        copyright <- map["channel.copyright"]
        entries <- map["channel.item"]
    }
}
