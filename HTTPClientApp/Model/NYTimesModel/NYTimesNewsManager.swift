import UIKit

class NYTimesNewsManager {
    var stringURL = "https://www.nytimes.com/svc/collections/v1/publish/https://www.nytimes.com/section/world/rss.xml"
    
    var delegate: NYTimesNewsManagerDelegate?

    func performRequest() {
        if let url = URL(string: stringURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.delegate?.didUpdateNYTimesNews(news: NYTimesFeed(XMLString: dataString!)!)
                    }
                }
            }
            
            task.resume()
        }
    }
}
