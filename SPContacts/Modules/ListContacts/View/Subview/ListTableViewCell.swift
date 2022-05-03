//
//  ListTableViewCell.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 25.04.22.
//

import UIKit

private extension ConstantSize {
    static let photoLeadingOffset: CGFloat = 10.0
    static let photoTopOffset: CGFloat = 10.0
    static let photoBottomOffset: CGFloat = 10.0
    static let nameLeadingOffset: CGFloat = 10.0
}

class ListTableViewCell: UITableViewCell {

    lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        return photoImageView
    }()

    lazy var nameLable: UILabel = {
        let nameLable = UILabel()
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        return nameLable
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setting()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setting() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setConstraints()
        
    }

    private func addSubviews() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLable)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: ConstantSize.photoLeadingOffset),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                constant: ConstantSize.photoTopOffset),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                   constant: -ConstantSize.photoBottomOffset),
            photoImageView.heightAnchor.constraint(equalToConstant: ConstantSize.smallImage),
            photoImageView.widthAnchor.constraint(equalToConstant: ConstantSize.smallImage),

            nameLable.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor,
                                               constant: ConstantSize.nameLeadingOffset),
            nameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
