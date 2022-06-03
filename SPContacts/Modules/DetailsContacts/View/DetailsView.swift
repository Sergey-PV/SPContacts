//
//  DetailsView.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 28.05.22.
//

import UIKit

class DetailsView: UIView {

    private(set) lazy var detailsTableView: UITableView = {
        let detailsTableView = UITableView(frame: .zero, style: .insetGrouped)
        detailsTableView.translatesAutoresizingMaskIntoConstraints = false
        detailsTableView.register(DetailsTableViewCell.self,
                                  forCellReuseIdentifier: ConstantString.detailsCellId)
        detailsTableView.backgroundColor = .clear
        return detailsTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(detailsTableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: detailsTableView.topAnchor),
            bottomAnchor.constraint(equalTo: detailsTableView.bottomAnchor),
            leadingAnchor.constraint(equalTo: detailsTableView.leadingAnchor),
            trailingAnchor.constraint(equalTo: detailsTableView.trailingAnchor)
        ])
    }
}
