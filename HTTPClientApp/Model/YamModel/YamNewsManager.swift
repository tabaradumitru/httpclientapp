
import UIKit

class YamNewsManager {
    var newsURL = "https://news.yam.md/ro/rss"
    var delegate: YamNewsManagerDelegate?
    
    func performRequest() {
        if let url = URL(string: newsURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.delegate?.didUpdateYamNews(news: YamFeed(XMLString: dataString!)!)
                    }
                }
            }
            task.resume()
        }
    }
}
