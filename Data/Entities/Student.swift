

import Foundation

// Declaración clase Student
class Student: Person {
    // Propiedades de la clase Student
    var photo: String
    var name: String
    var surname: String?
    var age: Date?
    var phone: String?
    var address: String?
    var email: String?
    
    var ageFormatted: String {
        if let studentBirthdate = age,
           let studentAge = Calendar.current.dateComponents([.year], from: studentBirthdate, to: Date()).year {
            return "\(studentAge) años"
        } else {
            return ""
        }
    }
    
    // Constructor o inicializador de la clase Student
    init(photo: String? = nil, name: String? = nil, surname: String? = nil, age: Date? = nil, phone: String? = nil, address: String? = nil, email: String? = nil) {
        
        // Always init all properties
        self.photo = photo ?? ""
        self.name = name ?? ""
        self.surname = surname
        self.age = age
        self.phone = phone
        self.address = address
        self.email = email
    }
}
