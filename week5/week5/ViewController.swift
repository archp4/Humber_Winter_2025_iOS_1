//
//  ViewController.swift
//  week5
//
//  Created by Arch Umeshbhai Patel on 2025-02-07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "red") {
            var redViewController = segue.destination as! RedViewController
            if let userInput = tfUserName.text, !userInput.isEmpty{
                redViewController.userName = userInput
            }
        }
    }
    
    @IBOutlet weak var tfUserName: UITextField!
}

