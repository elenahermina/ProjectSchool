//
//  SubjectsViewCell.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 04.02.21.
//


import UIKit


class SubjectViewCell: UICollectionViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCell.layer.cornerRadius = 8.0
        viewCell.showShadow()
        
        viewTitle.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        viewTitle.layer.cornerRadius = 8.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell.image = nil
        title.text = nil
    }
    
    func configure(image: String?, title: String?) {
        imageCell.image = UIImage(named: image ?? "")
        self.title.text = title
    }
}
