//
//  ViewController.swift
//  BMI_CAL_Assignment_1
//
//  Created by Arch Umeshbhai Patel on 2025-01-31.
//

import UIKit

class ViewController: UIViewController {

    var weightLabels = [ "Enter Your Weight in Kilogram (kg) ", "Enter Your Weight in Pounds (lb) " ]
    var heightLabels = [ "Enter Your Height in Centimeter (cm) ", "Enter Your Weight in Inches (inch) " ]
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabels()
        
    }
    @IBOutlet weak var weightLabelIB: UILabel!
    
    @IBOutlet weak var heightLabelIB: UILabel!
    
    
    @IBOutlet weak var resultLabelIB: UILabel!
    
    @IBOutlet weak var heightTFOutlet: UITextField!
    
    @IBOutlet weak var weightTFOutlet: UITextField!
    

    
    @IBAction func OnGetBMI(_ sender: UIButton) {
    
        var weight = Double(weightTFOutlet.text ?? "") ?? 0.0
        var height = Double(heightTFOutlet.text ?? "") ?? 0.0
        var isError = false
        var message = ""
        if weight > 0 && height > 0{
            var tempHeight = selectedIndex == 0 ? height * 0.01 : height * 0.0254
            var tempWeight = selectedIndex == 0 ? weight : weight * 0.453592
            var result = calc_bmi(height: tempHeight, weight: tempWeight)
            print("\(tempWeight) / \(tempHeight * tempHeight) : \(result)")
            if result < 18.5 {
                message = "Your BMI is UnderWeight"
                isError = false
            } else if result < 24.9 {
                message = "Your BMI is Normal"
                isError = false
            } else if result < 29.9 {
                message = "Your BMI is Overweight"
                isError = false
            } else if result < 100 {
                message = "Your BMI is Obecity"
                isError = false
            } else {
                message = "Input Error"
                isError = true
            }
        }
        else{
            isError = true
            message = "Enter invalid Weight and Height"
        }
        
        resultLabelIB.text = message
        resultLabelIB.textColor = isError ? UIColor(_colorLiteralRed: 255, green: 0, blue: 0, alpha: 1) : UIColor(_colorLiteralRed: 255, green: 255, blue: 255, alpha: 1)
        resultLabelIB.adjustsFontSizeToFitWidth = true
    }
    

    
    
    
    
    func calc_bmi(height inCM: Double, weight inKG: Double) -> Double {
        return inKG / ( inCM * inCM )
    }
    
    func updateLabels(){
        weightLabelIB.text = weightLabels[selectedIndex]
        heightLabelIB.text = heightLabels[selectedIndex]
    }

    
    @IBAction func uintSegement(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            selectedIndex = 0
        } else {
            selectedIndex = 1
        }
        updateLabels()
    }
    
}

