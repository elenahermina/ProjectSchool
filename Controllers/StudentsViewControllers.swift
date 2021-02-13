//
//  StudentsControllers.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 03.02.21.
//

import UIKit

class StudentsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PersonViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        if(indexPath.row < defaultStudents.count) {
            let studentSelected = defaultStudents[indexPath.row]
            destination.isStudent = true
            destination.person = studentSelected
            
            let studentSubjects = subjects(for: studentSelected)
            destination.personSubjects = studentSubjects
            destination.persons = teachers(in: studentSubjects)
            
        }
    }
    
    
    private func subjects(for student: Student) -> [Subject] {
        return defaultSubjects.filter { subject in
            return subject.students?.contains { $0.name.compare(student.name) == .orderedSame } ?? false
        }
    }
    
    private func teachers(in subjects: [Subject]) -> [Teacher] {
        // TODO: Obtener los profesores de las asignaturas sin duplicados y devolverlos
        return []
    }
}

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // En Swift 5 con una única línea de código no es obligatorio poner 'return'
        defaultStudents.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // En Swift 5 con una única línea de código no es obligatorio poner 'return'
        140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentViewCell",
                                                 for: indexPath) as? StudentViewCell
        
        if(indexPath.row < defaultStudents.count) {
            let data = defaultStudents[indexPath.row]
            
            cell?.configure(image: data.photo,
                            title: data.name,
                            subtitle: data.email,
                            birthdate: data.age?.formattedAge ?? "")
        }
         
        return cell ?? UITableViewCell()
    }
}

