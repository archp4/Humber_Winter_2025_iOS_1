//
//  Student.swift
//  week6
//
//  Created by Rania Arbash on 2025-02-14.
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
    init(id: UUID, name: String, email: String, imageData: Data? = nil) {
        self.name = name
        self.email = email
        self.imageData = imageData
    }
}

class StudentManager {
    
    static var shared = StudentManager()
    var studentsList : [Student] = []
    
    
    func addNewStudent(newStd: Student) {
        studentsList.append(newStd)
    }
    
    func deleteOneStudent(idtodelete: UUID)  {
        studentsList.removeAll { student in
            return student.id == idtodelete
        }
    }
    
    func update(updatedStudent: Student)  {
        let index =  studentsList.firstIndex(where: { student in
            print(student.id,"Updated: ", updatedStudent.id)
            return student.id == updatedStudent.id
        })
        
        print(index, "In Update")
        if index != nil {
            print("updated")
            studentsList[index!] = updatedStudent
        }
        
    }
    
}


