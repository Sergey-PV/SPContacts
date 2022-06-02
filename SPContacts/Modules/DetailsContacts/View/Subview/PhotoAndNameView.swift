//
//  PhotoAndNameView.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 2.06.22.
//

import UIKit

private extension ConstantSize {
    static let heightName: CGFloat = 30
    static let heightPhotoAndNameView = ConstantSize.heightName + ConstantSize.bigImage
}

class PhotoAndNameView: UIView {
    
    private(set) lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        return photoImageView
    }()
    
    private(set) lazy var nameLable: UILabel = {
        let nameLable = UILabel()
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        return nameLable
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame.size.height = ConstantSize.heightPhotoAndNameView
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
        addSubview(photoImageView)
        addSubview(nameLable)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: ConstantSize.bigImage),
            photoImageView.widthAnchor.constraint(equalToConstant: ConstantSize.bigImage),
            
            nameLable.topAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            nameLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLable.heightAnchor.constraint(equalToConstant: ConstantSize.heightName)
        ])
    }
    
}
