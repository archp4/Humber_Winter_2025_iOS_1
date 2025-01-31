//
//  ViewController.swift
//  week3
//
//  Created by Arch Umeshbhai Patel on 2025-01-31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        studentTable.dataSource = self
        studentTable.delegate = self
    }
    @IBOutlet weak var selectedRow: UILabel!
    
    var collegeList = ["Humber College", "Centennial College", "Seneca College"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow.text = "Selected College: \(collegeList[indexPath.row])"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // var cell  = UITableViewCell()
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "mycell")!
        cell2.textLabel?.text = collegeList[indexPath.row]
        return cell2
    }
    
    @IBOutlet weak var studentTable: UITableView!
    
    

}

