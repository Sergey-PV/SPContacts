//
//  ImportButton.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 13.04.22.
//

import UIKit

class ImportButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setting() {
        setTitle(ConstantsString.downloadContacts, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}