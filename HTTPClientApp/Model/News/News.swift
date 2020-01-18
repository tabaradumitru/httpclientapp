import Foundation
class News: Codable {
    var title: String?
    var link: String!
    var updated: String?
    var author: String?
    var summary: String?
    
    init(title: String, link: String!, updated: String, author: String, summary: String) {
        self.title = title
        self.link = link
        self.author = author
        self.updated = updated
        self.summary = summary
    }
}
