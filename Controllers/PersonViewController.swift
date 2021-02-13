//
//  PersonViewController.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 13.02.21.
//

import UIKit

class PersonViewController: UIViewController {
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var isStudent: Bool = false
    var person: Person?
    var persons: [Person] = []
    var personSubjects: [Subject] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureViews() {
        viewHeader.showShadow()
        
        imageHeader.image = UIImage(named: person?.photo ?? "")
        fullnameLabel.text = "\(String(describing: person?.name)) \(String(describing: person?.surname))"
        emailLabel.text = person?.email
        phoneLabel.text = person?.phone
        ageLabel.text = person?.ageFormatted
        addressLabel.text = person?.address
    }
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Subjects"
                
            default:
                return isStudent ? "Teachers" : "Students"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDataViewCell",
                                                 for: indexPath) as? CellDataViewCell
        
        switch indexPath.section {
            case 0:
                cell?.configure(data: personSubjects)
                
            default:
                cell?.configure(data: persons)
        }
        
        return cell ?? UITableViewCell()
    }
}
