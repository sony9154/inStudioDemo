//
//  ViewController.swift
//  inStudio
//
//  Created by Peter.Hsu on 2016/11/21.
//  Copyright © 2016年 Peter.Hsu. All rights reserved.
//

import UIKit

protocol ShowDetailDelegate {
    func showDetail(_ displayText:String)
}

class ViewController: UIViewController {
    var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailPage = segue.destination as? DetailPage,
            let displayString = sender as? String {
            detailPage.displayString = displayString
        }
    }
}

extension ViewController : UITableViewDelegate { }

extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryRow
        cell.categoryName = categories[indexPath.section]
        cell.showDetailDelegate = self
        return cell
    }
    
}

// Had to add this, even though it doesn't do anything.
extension ViewController : UIGestureRecognizerDelegate { }

extension ViewController : ShowDetailDelegate {
    func showDetail(_ displayText: String) {
        performSegue(withIdentifier: "ShowDetail", sender: displayText)
    }
}











