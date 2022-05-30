//
//  CloseButton.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 21.05.22.
//

import UIKit

class CloseButton: UIButton {

    init() {
        super.init(frame: .zero)
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setting() {
        setTitle(ConstantString.downloadContactsLocalized, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(ConstantColor.textButtonForNormal, for: .normal)
    }
}
