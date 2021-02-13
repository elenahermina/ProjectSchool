//
//  PersonProtocol.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 09.02.21.
//

import Foundation


protocol CellData {
    var photo: String { get set }
    var name: String { get set }
}


protocol Person: CellData {
    var ageFormatted: String { get }
    var surname: String? { get set }
    var email: String? { get set }
    var phone: String? { get set }
    var address: String? { get set }
}
