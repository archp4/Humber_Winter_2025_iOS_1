//
//  ViewController.swift
//  week3
//
//  Created by Arch Umeshbhai Patel on 2025-01-31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    var selectedCollegeIndex = 0
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return collegeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return collegeList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCollegeIndex = row
    }
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBAction func onInsertStundet(_ sender: Any) {
        var name = textFieldName.text ?? ""
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let year : String = formatter.string(from: datePicker.date)
        if name.count > 0 {
            var newObj = Student(name: name, college: collegeList[selectedCollegeIndex], yearOfBirth: Int(year) ?? 2025
            )
            myLocalModel?.addNewStudet(newStundent: newObj)
            studentTable.reloadData()
        }
        else{
            selectedRow.text = "Enter Name Please"
        }
    }
    
    
    @IBOutlet weak var collegePicker: UIPickerView!
    
    var myLocalModel : ProgrammingClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        studentTable.dataSource = self
        studentTable.delegate = self
        collegePicker.delegate = self
        collegePicker.dataSource = self
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

