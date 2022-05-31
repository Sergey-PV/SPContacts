//
//  ListView.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 25.04.22.
//

import UIKit

class ListView: UIView {
    private(set) lazy var listTableView: UITableView = {
        let listTableView = UITableView()
        listTableView.register(ListTableViewCell.self,
                               forCellReuseIdentifier: ConstantString.listCellId)
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        //listTableView.allowsSelection = false
        return listTableView
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(listTableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            listTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            listTableView.topAnchor.constraint(equalTo: topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
