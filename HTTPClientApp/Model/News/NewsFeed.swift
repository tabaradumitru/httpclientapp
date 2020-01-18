class NewsFeed {
    var title: String!
    var link: String!
    var entries: [News]!
    
    init(feed: YamFeed) {
        self.title = feed.title
        self.link = feed.link
        self.entries = [News]()
        feed.entries.forEach({ news in
            self.entries.append(News(title: news.title ?? "",
                                     link: news.link ?? "",
                                     updated: news.updated ?? "",
                                     author: news.author ?? "",
                                     summary: news.summary.summary ?? "" ))
        })
    }
    
    init(feed: NYTimesFeed) {
        self.title = feed.title
        self.link = feed.link
        self.entries = [News]()
        feed.entries.forEach({ news in
            self.entries.append(News(title: news.title, link: news.link, updated: news.updated, author: news.author, summary: news.summary))
        })
    }
}
