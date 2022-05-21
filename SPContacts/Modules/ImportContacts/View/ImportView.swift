//
//  ImportView.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 13.04.22.
//

import UIKit

class ImportView: UIView {
    
    private(set) lazy var importButton = ImportButton()

    init() {
        super.init(frame: .zero)
        setting()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setting() {
        backgroundColor = ConstantColor.backgroud
    }
    
    private func addSubviews() {
        addSubview(importButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            importButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            importButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
