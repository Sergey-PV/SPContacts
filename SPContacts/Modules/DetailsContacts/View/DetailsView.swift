//
//  DetailsView.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 28.05.22.
//

import UIKit

private extension ConstantColor {
    static let backgroundOfDetailView = UIColor.systemGray6
    static let backgroundOfDetailTable = UIColor.clear
}

// MARK: - DetailsView
class DetailsView: UIView {

    // MARK: - UIElements
    private(set) lazy var detailsTableView: UITableView = {
        let detailsTableView = UITableView(frame: .zero, style: .insetGrouped)
        detailsTableView.translatesAutoresizingMaskIntoConstraints = false
        detailsTableView.register(DetailsTableViewCell.self,
                                  forCellReuseIdentifier: ConstantString.detailsCellId)
        detailsTableView.backgroundColor = ConstantColor.backgroundOfDetailTable
        return detailsTableView
    }()
    
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        backgroundColor = ConstantColor.backgroundOfDetailView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
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
