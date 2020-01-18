import Foundation

class UserDefaultsStorage {
    let defaults = UserDefaults.standard
    let newsKey = "News"
    
    func addNews(news: News) {
        var allNews = getAllNews()

        let stringifiedNews = stringify(encode(news))
        
        allNews.append(stringifiedNews)
        
        defaults.set(allNews, forKey: newsKey)
    }
    
    func getAllNews() -> [String] {
        let allNews = defaults.array(forKey: newsKey) as? [String] ?? [String]()
        
        var stringNews = [String]()
        
        allNews.forEach({ news in
            stringNews.append(news)
        })
        
        if stringNews.count > 0 {
            return stringNews
        }
        
        return [String]()
    }
    
    func stringify(_ object: Data) -> String {
        return String(decoding: object, as: UTF8.self)
    }
    
    func encode(_ object: News) -> Data {
        return try! JSONEncoder().encode(object)
    }
    
    func getAllNewsArray() -> [News] {
        let allNews = getAllNews()
        var newsArray = [News]()
        
        allNews.forEach({news in
            let data = Data(news.utf8)
            newsArray.append(try! JSONDecoder().decode(News.self, from: data.self))
        })
        
        return newsArray
    }
    
    func checkIfNewsExistInStorage(link: String) -> Bool {
        let allNews = getAllNewsArray()
        var newsExist = false
        
        allNews.forEach({ news in
            if link == news.link {
                newsExist = true
            }
        })
        return newsExist
    }
    
    func removeNews(_ news: News) {
        let allNews = getAllNewsArray()
        var newNewsArray = [String]()
        
        allNews.forEach({ newsItem in
            if news.link != newsItem.link {
                let stringifiedNews = stringify(encode(newsItem))
                newNewsArray.append(stringifiedNews)
            }
        })
        defaults.set(newNewsArray, forKey: newsKey)
    }
    
    func clearStorage() {
        defaults.removeObject(forKey: newsKey)
    }
}
