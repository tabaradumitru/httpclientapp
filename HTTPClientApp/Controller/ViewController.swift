//
//  ViewController.swift
//  HTTPClientApp
//
//  Created by Dumitru Tabara on 1/9/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NYTimesNewsManagerDelegate, YamNewsManagerDelegate {
    var nyTimesNewsManager = NYTimesNewsManager()
    var loaderViewController = LoaderViewController()
    var yamNewsManager = YamNewsManager()
    var nyTimesNewsFeed: NYTimesFeed?
    var newsArray: [News]?
    var storage = UserDefaultsStorage()
    var displayStorageNews = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nyTimesNewsManager.delegate = self
        yamNewsManager.delegate = self
    }

    @IBAction func loadSavedFeed(_ sender: UIButton) {
        newsArray = storage.getAllNewsArray()
        if newsArray!.count > 0 {
            displayStorageNews = true
            self.performSegue(withIdentifier: "showNewsTableSegue", sender: self)
        }
    }
    
    @IBAction func showYamNewsTable(_ sender: UIButton) {
        loaderViewController = self.storyboard?.instantiateViewController(withIdentifier: "loaderViewController") as! LoaderViewController
        self.present(loaderViewController, animated: true, completion: nil)
        self.yamNewsManager.performRequest()
    }
    
    @IBAction func showNYTimesNewsTable(_ sender: UIButton) {
        loaderViewController = self.storyboard?.instantiateViewController(withIdentifier: "loaderViewController") as! LoaderViewController
        self.present(loaderViewController, animated: true, completion: nil)
        nyTimesNewsManager.performRequest()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNewsTableSegue" {
            let destinationVC = segue.destination as! NewsTableViewController
            destinationVC.newsArray = newsArray
            destinationVC.displayStorageNews = displayStorageNews
            displayStorageNews = false
        }
    }
    
    func didUpdateNYTimesNews(news: NYTimesFeed) {
        newsArray = NewsFeed(feed: news).entries
        
        DispatchQueue.main.async {
            self.loaderViewController.stopLoader()
            self.performSegue(withIdentifier: "showNewsTableSegue", sender: self)
        }
    }
    
    func didUpdateYamNews(news: YamFeed) {
        newsArray = NewsFeed(feed: news).entries

        DispatchQueue.main.async {
            self.loaderViewController.stopLoader()
            self.performSegue(withIdentifier: "showNewsTableSegue", sender: self)
        }
    }
    
}

