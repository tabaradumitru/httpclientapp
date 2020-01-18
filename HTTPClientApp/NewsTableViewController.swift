//
//  NYTimesNewsTableViewController.swift
//  HTTPClientApp
//
//  Created by Dumitru Tabara on 1/9/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    var newsArray: [News]?
    
    var storage = UserDefaultsStorage()
    var displayStorageNews = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemCell", for: indexPath) as! NewsTableViewCell
        cell.titleLabel!.text = newsArray![indexPath.row].title
        cell.authorLabel!.text = newsArray![indexPath.row].author
        cell.updatedAtLabel!.text = newsArray![indexPath.row].updated
        cell.summaryLabel!.text = newsArray![indexPath.row].summary
        cell.currentNews = newsArray![indexPath.row]
        if displayStorageNews {
            cell.isNewsFromStorage = true
            cell.newsTableViewController = self
        }
        
        if storage.checkIfNewsExistInStorage(link: newsArray![indexPath.row].link) && !displayStorageNews {
            cell.saveButton.isHidden = true
        }
        
        if displayStorageNews {
            cell.saveButton.layer.backgroundColor = UIColor.red.cgColor
            cell.saveButton.setTitle("Delete", for: .normal)
        }

        
        // check if this news is in storage, if is in storage, then hide the save button
        

//         Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let url = URL(string: newsArray![indexPath.row].link) {
            UIApplication.shared.open(url)
        } else {
            print("nu merge")
        }
//        let url = URL(string: entries![indexPath.row].link)
//        selectedReminder = dataToShow[indexPath.row]
        
//        performSegue(withIdentifier: "showUpdateReminder", sender: self)
    }
    
    func getDateAsString(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
    func reloadStorageNews() {
        newsArray = storage.getAllNewsArray()
        if newsArray?.count == 0 {
            self.dismiss(animated: true, completion: nil)
        }
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
