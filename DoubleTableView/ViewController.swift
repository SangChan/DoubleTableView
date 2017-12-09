//
//  ViewController.swift
//  DoubleTableView
//
//  Created by SangChan Lee on 05/12/2017.
//  Copyright © 2017 SangChan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var subTableView: UITableView!
    
    let dataModel : [String: [String]] = [
        "1" : [ "1.1", "1.2", "1.3", "1.4" ],
        "2" : [ "2.1", "2.4" ],
        "3" : [ "3.1", "3.3", "3.4"],
        "4" : [ "4.0" ]
    ]
    
    var selectedRow : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainTableView.dataSource = self
        mainTableView.delegate = self
        subTableView.dataSource = self
        subTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return dataModel.keys.count
        }
        guard let row = selectedRow else { return 0 }
        let array = dataModel.keys.sorted()
        let key = array[row]
        guard let selectedArray = dataModel[key] else { return 0 }
        return selectedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell")
            cell?.textLabel?.text = dataModel.keys.sorted()[indexPath.row]
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "rightCell")
        cell?.textLabel?.text = "wow"
        guard let row = selectedRow else { return cell! }
        let array = dataModel.keys.sorted()
        let key = array[row]
        guard let selectedArray = dataModel[key] else { return cell! }
        cell?.textLabel?.text = selectedArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            self.selectedRow = indexPath.row
            self.subTableView.reloadData()
        }
        
    }
}

