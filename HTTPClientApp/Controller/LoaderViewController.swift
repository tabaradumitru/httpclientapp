//
//  LoaderViewController.swift
//  HTTPClientApp
//
//  Created by Dumitru Tabara on 1/11/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import UIKit
import SwiftUI

class LoaderViewController: UIViewController {
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var loaderImage: UIImageView!
    @IBOutlet weak var progressBar: UIView!
    
    var runCount = 0
    var progressBarWidth = 1
    var screenSafeWidth = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenSafeWidth = Int(UIScreen.main.bounds.width - 40)

        self.startLoader()
    }
    
    
    func stopLoader() {
        self.dismiss(animated: false, completion: nil)
    }
    
    func startLoader() {
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                self.changeLabelText(textToPrint: "\(self.runCount)")
                self.runCount += 1
                self.setProgressBarWidth()
                
                if self.runCount == 101 {
                    timer.invalidate()
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    func changeLabelText(textToPrint: String) {
        self.percentLabel.text = "\(textToPrint)%"
    }
    
    func setProgressBarWidth() {
        let currentXPos = Int(progressBar.frame.origin.x)
        let currentYPos = Int(progressBar.frame.origin.y)
        progressBar.frame = CGRect(x: currentXPos, y: currentYPos, width: Int(screenSafeWidth * runCount) / 100, height: 3)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
