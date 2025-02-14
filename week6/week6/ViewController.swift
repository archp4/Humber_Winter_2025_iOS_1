//
//  ViewController.swift
//  week6
//
//  Created by Arch Umeshbhai Patel on 2025-02-14.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var model : StudentManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    //
        model = ((UIApplication.shared.delegate) as! AppDelegate).myModel
    }
    
    var selectedImageData : Data? = UIImage(named: "img")?.pngData()
    
    @IBOutlet weak var IBName: UITextField!
    
    @IBOutlet weak var IBEmail: UITextField!
    
    @IBAction func uploadImage(_ sender: Any) {
        let c = UIImagePickerController()
        c.sourceType = .photoLibrary
        // c.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera:.photoLibrary
        c.delegate = self
        c.allowsEditing = false
                
                
        present(c, animated: true)
    }
    
    
    
    @IBOutlet weak var IBImageHolder: UIImageView!
    
    
    @IBAction func AddStudent(_ sender: Any) {
        if let name = IBName.text,let email = IBEmail.text {
            if !name.isEmpty, !email.isEmpty{
                let newStudent = Student(name: name, email: email, imageData: selectedImageData)
                let alert = UIAlertController(title: "Are Your Sure!!", message: "New Student will Added Now", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.model?.addNewStudent(newStd: newStudent)
                }))
                present(alert, animated: true)
                IBName.text = "";
                IBEmail.text = "";
                IBImageHolder.image = UIImage(named: "img")
                
            } else {
                let alert = UIAlertController(title: "Missing Data", message: "You Need to Added Name and Email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info:
    [UIImagePickerController.InfoKey : Any]){
        print("image selected")
        
        let selectedImage = info[.originalImage] as? UIImage
        selectedImageData = selectedImage?.pngData()
        IBImageHolder.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        print("picker canceled")
        dismiss(animated: true, completion: nil)
        
    }
    
}

