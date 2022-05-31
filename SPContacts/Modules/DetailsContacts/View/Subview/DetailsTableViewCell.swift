//
//  DetailsTableViewCell.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 29.05.22.
//

import UIKit

private extension ConstantSize {
    static let textLeadingOffset: CGFloat = 20
    static let textTralingOffset: CGFloat = 20
}

class DetailsTableViewCell: UITableViewCell {
    
    private(set) lazy var titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        return titleLable
    }()
    
    private(set) lazy var infoTextField: UITextField = {
        let infoTextField = UITextField()
        infoTextField.translatesAutoresizingMaskIntoConstraints = false
        return infoTextField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setting() {
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(titleLable)
        addSubview(infoTextField)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: titleLable.topAnchor),
            leadingAnchor.constraint(equalTo: titleLable.leadingAnchor,
                                     constant: -ConstantSize.textLeadingOffset),
            trailingAnchor.constraint(equalTo: titleLable.trailingAnchor,
                                      constant: ConstantSize.textTralingOffset),
            
            infoTextField.topAnchor.constraint(equalTo: titleLable.bottomAnchor),
            infoTextField.leadingAnchor.constraint(equalTo: titleLable.leadingAnchor),
            infoTextField.trailingAnchor.constraint(equalTo: titleLable.trailingAnchor)
            
        ])
    }
}
