//
//  ImportView.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 13.04.22.
//

import UIKit

// MARK: - Constants
private extension ConstantSize {
    static let offsetOfTrailingCloseButton: CGFloat = -10
    static let offsetOfTopCloseButton: CGFloat = 10
}

// MARK: - ImportView
class ImportView: UIView {
    
    private(set) lazy var importButton = ImportButton()
    private(set) lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .close)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()

    // MARK: - Initialize
    init() {
        super.init(frame: .zero)
        setting()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setting() {
        backgroundColor = ConstantColor.backgroud
    }
    
    private func addSubviews() {
        addSubview(importButton)
        addSubview(closeButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            importButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            importButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            closeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: ConstantSize.offsetOfTrailingCloseButton),
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                             constant: ConstantSize.offsetOfTopCloseButton)
        ])
    }
}
