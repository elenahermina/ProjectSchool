//
//  SubjectsController.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 04.02.21.
//

import UIKit

class SubjectsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    // Lifecycle - Cuando se crea la vista del viewController
    override func loadView() {
        super.loadView()
        print("SubjectsViewController loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SubjectsViewController viewDidLoad")

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // Lifecycle - Cuando se muestra el viewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SubjectsViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SubjectsViewController viewDidAppear")
    }
    
    // Lifecycle - Cuando dejan de ser visible el viewController
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SubjectsViewController viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SubjectsViewController viewDidDisappear")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SubjectViewController,
              let cell = sender as? UICollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        
        if(indexPath.row < defaultSubjects.count) {
            destination.subject = defaultSubjects[indexPath.row]
            // 5.- Asignamos en el destination la variable creada 'delegate'
            destination.delegate = self
        }
    }
}

// 4.- Crear una extension de SubjectsViewController para conformar el protocolo creado en SubjectViewController
// e implementamos los métodos del protocolo
extension SubjectsViewController: SubjectViewDelegate {
    func onDelete(subject: Subject?) {
        defaultSubjects.removeAll { $0.name == subject?.name }
        collectionView.reloadData()
    }
}


extension SubjectsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        defaultSubjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 16,
               height: collectionView.frame.width / 2 - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectViewCell",
                                                      for: indexPath) as? SubjectViewCell
        
        if(indexPath.row < defaultSubjects.count) {
            let data = defaultSubjects[indexPath.row]
            cell?.configure(image: data.photo,
                            title: data.name)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "FROM_SUBJECTS_TO_SUBJECT",
//                     sender: indexPath)
//    }
}
