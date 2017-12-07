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
        "2" : [ "2.1", "2.1" ],
        "3" : [ "3.1", "3.3", "3.4"],
        "4" : [ "4.0" ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

