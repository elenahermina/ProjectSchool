//
//  UIViewExtension.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 13.02.21.
//

import UIKit

extension UIView {
    
    // Añadimos esta función a cualquier View
    func showShadow(opacity: Float = 0.4,
                    color: CGColor = UIColor.gray.cgColor,
                    offset: CGSize = CGSize.zero) {
        layer.shadowColor = color
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
    }
}

