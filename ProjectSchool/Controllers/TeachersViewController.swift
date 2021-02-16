//
//  TeachersController.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 04.02.21.
//

import UIKit

class TeachersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TeachersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // En Swift 5 con una única línea de código no es obligatorio poner 'return'
        defaultTeachers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // En Swift 5 con una única línea de código no es obligatorio poner 'return'
        140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherViewCell",
                                                 for: indexPath) as? TeacherViewCell
        
        if(indexPath.row < defaultTeachers.count) {
            let data = defaultTeachers[indexPath.row]
            cell?.configure(image: data.photo,
                            title: data.name,
                            subtitle: data.email,
                            description: data.ageFormatted)
        }
         
        return cell ?? UITableViewCell()
    }
}
