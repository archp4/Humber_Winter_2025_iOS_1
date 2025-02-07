//
//  RedViewController.swift
//  week5
//
//  Created by Arch Umeshbhai Patel on 2025-02-07.
//

import UIKit

class RedViewController: UIViewController {

    
    var userName : String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUserName.text = "Welcome \(userName)"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var labelUserName: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
