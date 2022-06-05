//
//  PhotoAndNameView.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 2.06.22.
//

import UIKit

// MARK: - Constants
private extension ConstantSize {
    static let heightOfName: CGFloat = 30
    static let heightOfPhotoAndNameView = ConstantSize.heightOfName + ConstantSize.bigImage
    static let numberOfLinesInNameLabel = 5
    static let minimumScaleFactorOfNameLable: CGFloat = 10
    static let fontOfNameLabel: CGFloat = 30
    static let offsetOfTopNameLabel: CGFloat = 15
    static let offsetOfBottomNameLabel: CGFloat = 15
}

// MARK: - PhotoAndNameView
class PhotoAndNameView: UIView {
    
    // MARK: - UIElements
    private(set) lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        return photoImageView
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.minimumScaleFactor = ConstantSize.minimumScaleFactorOfNameLable
        nameLabel.numberOfLines = ConstantSize.numberOfLinesInNameLabel
        nameLabel.font = UIFont.boldSystemFont(ofSize: ConstantSize.fontOfNameLabel)
        return nameLabel
    }()

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame.size.height = ConstantSize.heightOfPhotoAndNameView
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
        addSubview(photoImageView)
        addSubview(nameLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: ConstantSize.bigImage),
            photoImageView.widthAnchor.constraint(equalToConstant: ConstantSize.bigImage),
            
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor,
                                           constant: ConstantSize.offsetOfTopNameLabel),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: -ConstantSize.offsetOfBottomNameLabel),
            nameLabel.heightAnchor.constraint(equalToConstant: ConstantSize.heightOfName),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
}
