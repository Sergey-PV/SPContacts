//
//  CloseButton.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 21.05.22.
//

import UIKit

// MARK: - CloseButton
class CloseButton: UIButton {

    // MARK: - Initialize
    init() {
        super.init(frame: .zero)
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setting() {
        setTitle(ConstantString.downloadContactsLocalized, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(ConstantColor.textButtonForNormal, for: .normal)
    }
}
