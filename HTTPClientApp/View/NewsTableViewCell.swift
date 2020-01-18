//
//  NYTimesNewsTableViewCell.swift
//  HTTPClientApp
//
//  Created by Dumitru Tabara on 1/10/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var newsTableViewController: NewsTableViewController?
    var currentNews: News?
    let storage = UserDefaultsStorage()
    var isNewsFromStorage = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func saveNews(_ sender: UIButton) {
        if isNewsFromStorage {
            storage.removeNews(currentNews!)
            newsTableViewController!.reloadStorageNews()
            return
        }
        
        storage.addNews(news: currentNews!)
        sender.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
