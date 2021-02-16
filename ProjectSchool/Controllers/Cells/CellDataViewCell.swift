//
//  CellDataViewCell.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 13.02.21.
//

import UIKit

class CellDataViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cellData = [CellData]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellData = []
    }
    
    func configure(data: [CellData]) {
        cellData = data
    }
}

extension CellDataViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 130,
               height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonViewCell",
                                                      for: indexPath) as? PersonViewCell
        
        if(indexPath.row < cellData.count) {
            cell?.configure(with: cellData[indexPath.row])
        }
        
        return cell ?? UICollectionViewCell()
    }
}
