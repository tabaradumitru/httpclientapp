import XMLMapper

class YamSummary: XMLMappable {
    var nodeName: String!
    
    var type: String!
    var summary: String!
    
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        type <- map.attributes["type"]
        summary <- map.innerText
    }
}
