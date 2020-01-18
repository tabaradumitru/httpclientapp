class PerformRequest {
    func performRequest(to: stringURL) {
        if let url = URL(string: to) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data: response:  error: ))
            
            task.resume()
        }
    }
}
