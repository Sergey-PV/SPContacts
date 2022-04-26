//
//  ListViewController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 25.04.22.
//

import UIKit

private extension ConstantString {
    
}

class ListViewController: UIViewController {
    
    private lazy var listView: ListView = {
        guard let view = view else { return ListView() }
        return (view as! ListView)
    }()
    
    override func loadView() {
        view = ListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ConstantColor.backgroud
        listView.listTableView.delegate = self
        listView.listTableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantString.listCellId,
                                                 for: indexPath)
        return cell
    }
}
