//
//  DetailsTableViewCell.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 29.05.22.
//

import UIKit

// MARK: - Constants
private extension ConstantSize {
    static let offsetOfLeadingTitleLable: CGFloat = 20
    static let offsetOfTralingTitleLable: CGFloat = 20
    static let fontOfTitleLable: CGFloat = 15
}

private extension ConstantColor {
    static let textOfValueLabel = UIColor.systemBlue
}

// MARK: - DetailsTableViewCell
class DetailsTableViewCell: UITableViewCell {
    
    // MARK: - UIElements
    private(set) lazy var titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.font = UIFont.systemFont(ofSize: ConstantSize.fontOfTitleLable)
        return titleLable
    }()
    
    private(set) lazy var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textColor = ConstantColor.textOfValueLabel
        return valueLabel
    }()

    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setting() {
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(titleLable)
        addSubview(valueLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: titleLable.topAnchor),
            leadingAnchor.constraint(equalTo: titleLable.leadingAnchor,
                                     constant: -ConstantSize.offsetOfLeadingTitleLable),
            trailingAnchor.constraint(equalTo: titleLable.trailingAnchor,
                                      constant: ConstantSize.offsetOfTralingTitleLable),
            
            valueLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: titleLable.leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: titleLable.trailingAnchor)
            
        ])
    }
}
