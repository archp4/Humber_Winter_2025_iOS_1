//
//  Student.swift
//  week3
//
//  Created by Arch Umeshbhai Patel on 2025-01-31.
//

import Foundation

class Student {
    var id = UUID()
    var name : String
    var college: String
    var yearOfBirth: Int
    
    init(id: UUID = UUID(), name: String, college: String, yearOfBirth: Int) {
        self.id = id
        self.name = name
        self.college = college
        self.yearOfBirth = yearOfBirth
    }
}


class ProgrammingClass {
    var listOfStudents =  [
        Student(name: "Arch", college: "Humber", yearOfBirth: 2000),
        Student(name: "Dhruv", college: "St.Clair", yearOfBirth: 2000),
        Student(name: "Aditya", college: "Charusat", yearOfBirth: 1996)
    ]
    
    func addNewStudet (newStundent: Student){
        listOfStudents.append(newStundent)
    }
    
    func editStudent(updatedStudent: Student){
        
    }
    
    func deleteStudent(removeStudent: Student){
    
    }
}
