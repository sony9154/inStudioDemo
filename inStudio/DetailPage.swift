//
//  DetailPage.swift
//  inStudio
//
//  Created by Peter.Hsu on 2016/11/22.
//  Copyright © 2016年 Peter.Hsu. All rights reserved.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var displayString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel?.text = displayString
        // Do any additional setup after loading the view.
    }

    @IBAction func homeBtnTapped(_ sender: Any) {
                self.presentingViewController!.dismiss(animated: true, completion: nil)        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
