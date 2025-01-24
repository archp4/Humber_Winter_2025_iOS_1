//
//  ViewController.swift
//  Week2
//
//  Created by Arch Umeshbhai Patel on 2025-01-24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myLetterPicker: UIPickerView!
    @IBOutlet weak var myNumberPicker: UIPickerView!
    
    
    
    var letters  = ["a","b","c","d","e"]
    var numbers = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myPicker.delegate = self
        myPicker.dataSource = self
        myPicker.tag = 1
        
        myNumberPicker.delegate = self
        myNumberPicker.dataSource = self
        myNumberPicker.tag = 2
        
        myLetterPicker.delegate = self
        myLetterPicker.dataSource = self
        myLetterPicker.tag = 3
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1 {
            return 2
        }
        else{
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return 10
        } else if pickerView.tag == 2 {
            return numbers.count
        } else {
            return letters.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            if component == 0 {
                return "iOS 1"
            }
            else {
                return "Humber"
            }
        } else if pickerView.tag == 2 {
            return numbers[row]
        }
        else{
            return letters[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            myLabel.text = "Column \(component) : Row \(row)"
        } else if pickerView.tag == 2 {
            letters.append(numbers[row])
            numbers.remove(at: row)
            myNumberPicker.reloadAllComponents()
            myLetterPicker.reloadAllComponents()
        } else{
            numbers.append(letters[row])
            letters.remove(at: row)
            myNumberPicker.reloadAllComponents()
            myLetterPicker.reloadAllComponents()
        }
    }
    
}



