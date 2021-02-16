

import Foundation

// Class TeacherDAO
class Teacher: Person {
    //Properties whit optional '?' value can be nil
    var photo: String
    var name: String
    var surname: String?
    var age: Date?
    var email: String?
    var phone: String?
    var address: String?
    
    var ageFormatted: String {
        if let teacherBirthdate = age,
           let teacherAge = Calendar.current.dateComponents([.year], from: teacherBirthdate, to: Date()).year {
            return "\(teacherAge) años"
        } else {
            return ""
        }
    }
    
    // Custom init (Constructor) class with default values
    init(photo: String? = nil, name: String? = nil, surname: String? = nil, age: Date? = nil, email: String? = nil, phone: String? = nil, address: String? = nil) {
        
        // Always init all properties
        self.photo = photo ?? ""
        self.name = name ?? ""
        self.surname = surname
        self.age = age
        self.email = email
        self.phone = phone
        self.address = address
    }
}
