//
//  ListTableViewCell.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 25.04.22.
//

import UIKit

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
        addSubviews()
        setConstraints()
        
    }

    private func addSubviews() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLable)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalToConstant: ConatantSize.smallImage),
            photoImageView.widthAnchor.constraint(equalToConstant: ConatantSize.bigImage),

            nameLable.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            nameLable.trailingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
