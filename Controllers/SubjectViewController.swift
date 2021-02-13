//
//  ColectionBootcampController.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 05.02.21.
//

import UIKit

// 1.- Crear un protocolo con una función para notificar la asignatura que se debe eliminar
protocol SubjectViewDelegate: AnyObject {
    func onDelete(subject: Subject?)
}


class SubjectViewController: UIViewController {
    // MARK: - IBOtulet
    @IBOutlet weak var subjectImage: UIImageView!
    @IBOutlet weak var subjectTitle: UILabel!
    @IBOutlet weak var subjectDate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteButton: UIButton!
    
    // MARK: - IBAction
    @IBAction func onDeletePressed(_ sender: UIButton) {
        if let subjectName = subject?.name {
            showAlert(style: .alert,
                      title: "Eliminar asignatura",
                      message: "Se va a eliminar la asignatura \(subjectName) de forma permanente",
                      onAccept:  { action in
                        // Eliminar la asignatura 'Subject'
                        // defaultSubjects.removeAll { $0.name == self.subject?.name }
                        
                        // 3.- Notificar al delegado 'delegate' la asignatura que debe eliminar
                        self.delegate?.onDelete(subject: self.subject)
                        
                        // Volver a la pantalla anterior
                        self.navigationController?.popViewController(animated: true)
                      })
        }
    }

    // MARK: - Properties
    // 2.- Crear una variable 'delegate' que sea del tipo del protocolo creado
    weak var delegate: SubjectViewDelegate? = nil
    var subject: Subject? = nil
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectImage.image = UIImage(named: subject?.photo ?? "")
        subjectTitle.text = subject?.name
        
        if let subjectYear = subject?.year {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "'Inicio el' dd 'de' MMMM 'del' yyyy"
            subjectDate.text = dateFormatter.string(from: subjectYear)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension SubjectViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Teachers"
                
            default:
                return "Students"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDataViewCell",
                                                 for: indexPath) as? CellDataViewCell
        
        switch indexPath.section {
            case 0:
                cell?.configure(data: subject?.teachers ?? [])
            default:
                cell?.configure(data: subject?.students ?? [])
        }
        
        return cell ?? UITableViewCell()
    }
}
