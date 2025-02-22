//
//  ViewController.swift
//  week6
//
//  Created by Rania Arbash on 2025-02-14.
//

import UIKit

protocol AddingNewStudentDelegate{
    
    func addingNewStudentDidFinishWithStudnetObject(newStudent: Student,isEdit: Bool)
    func addingNewStudentDidCancel()
}

protocol UpdateStudentDelegate{
    
    func updateStudentDidFinishWithStudnetObject(newStudent: Student,isEdit: Bool)
    func updateStudentDidCancel()
}



class ViewController: UIViewController ,
                        UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {

    
    var addDelegate : AddingNewStudentDelegate?
    var updateDelegate : UpdateStudentDelegate?
    var isEdit: Bool = false;
    var student: Student?
    var selectedImageData : Data? = UIImage(named: "img")?.pngData()
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    var model: StudentManager?
    var id: UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if student != nil {
            isEdit = true
            isEditing()
        }
        // Do any additional setup after loading the view.
        model = ((UIApplication.shared.delegate) as! AppDelegate).myModel
    }

    
    func isEditing(){
        nameText.text = student?.name
        emailText.text = student?.email
        id = student?.id
        print(student?.id)
        userImage.image = UIImage(data: (student?.imageData ?? UIImage(named: "img")?.pngData())!)
    }
    
    @IBAction func uploadPhotoClicked(_ sender: Any) {
        
        let c = UIImagePickerController()
        c.sourceType = .photoLibrary
        //UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera:.photoLibrary
        c.delegate = self
        c.allowsEditing = false
        present(c, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, 
                               didFinishPickingMediaWithInfo info:
    [UIImagePickerController.InfoKey : Any]){
        print("image selected")
        
        let selectedImage = info[.originalImage] as? UIImage
        selectedImageData = selectedImage?.pngData()
        
        userImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        print("picker canceled")
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func SaveNewStudnet(_ sender: Any) {
        if let name = nameText.text , let email = emailText.text {
            if !name.isEmpty , !email.isEmpty {
               
                let alert = isEdit ? UIAlertController(title: "Are You Sure!", message: "Student \(name) Will Be update Now", preferredStyle: .alert) : UIAlertController(title: "Are You Sure!", message: "New Student \(name) Will Be inserted Now", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    var newStd = Student(id: self.isEdit ? self.id!:UUID() , name: name, email: email, imageData: self.selectedImageData)
                    self.selectedImageData = UIImage(named: "img")?.pngData()
                    self.addDelegate?.addingNewStudentDidFinishWithStudnetObject(newStudent: newStd,isEdit: self.isEdit)
                    self.dismiss(animated: true)
                }))
                
                present(alert, animated: true)
                nameText.text = ""
                emailText.text = ""
                userImage.image = UIImage(named: "img")
                    
            }else {
                
                let alert = UIAlertController(title: "Missing Info!", message: "You Have to enter your name and your email", preferredStyle: .actionSheet)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
                
                
            }
        }
        
        
    }
    
    
    @IBAction func CancelClicked(_ sender: Any) {
        addDelegate?.addingNewStudentDidCancel()
        dismiss(animated: true)
    }
    
    
    

}

