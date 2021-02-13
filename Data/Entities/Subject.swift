

import Foundation

class Subject: CellData {
    //Properties whit optional '?' value
    var photo: String
    var name: String
    var year: Date?
    var teachers: [Teacher]?
    var students: [Student]?
    
    // Custom init (Constructor) class with default values
    init(photo: String? = nil, name: String? = nil, year: Date? = nil, teachers: [Teacher]? = nil, students: [Student]? = nil) {
        
        // Always init all properties
        self.photo = photo ?? ""
        self.name = name ?? ""
        self.year = year
        self.teachers = teachers
        self.students = students
    }
}
