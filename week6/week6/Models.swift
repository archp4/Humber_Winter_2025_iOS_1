//
//  Models.swift
//  week6
//
//  Created by Arch Umeshbhai Patel on 2025-02-14.
//

import Foundation

class Student {
    var id : UUID = UUID()
    var name: String = ""
    var email : String = ""
    var imageData : Data?
    
    init(name: String, email: String, imageData: Data? = nil) {
        self.name = name
        self.email = email
        self.imageData = imageData
    }
}

class StudentManager {
    
    var studentsList : [Student] = []
    
    
    func addNewStudent(newStd: Student) {
        studentsList.append(newStd)
    }
    
    func deleteOneStudent(idtodelete: UUID)  {
        studentsList.removeAll { student in
            return student.id == idtodelete
        }
    }
    
}
