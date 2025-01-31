//
//  ViewController.swift
//  week3
//
//  Created by Arch Umeshbhai Patel on 2025-01-31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myLocalModel : ProgrammingClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        studentTable.dataSource = self
        studentTable.delegate = self
        myLocalModel = ((UIApplication.shared.delegate) as! AppDelegate).myModel
    }
    @IBOutlet weak var selectedRow: UILabel!
    
    
    
    var collegeList = ["Humber College", "Centennial College", "Seneca College"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLocalModel?.listOfStudents.count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow.text = "Selected Student: \(myLocalModel?.listOfStudents[indexPath.row].name ?? "Error Loading")"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // var cell  = UITableViewCell()
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "mycell")!
        
        cell2.textLabel?.text = "Student Name:  \(myLocalModel?.listOfStudents[indexPath.row].name ?? "Error Loading")"
        cell2.detailTextLabel?.text = "Student College: \(myLocalModel?.listOfStudents[indexPath.row].college ?? "Error Loading")"
        return cell2
    }
    
    @IBOutlet weak var studentTable: UITableView!
    
    

}

