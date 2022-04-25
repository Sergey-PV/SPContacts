//
//  ListViewController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 25.04.22.
//

import UIKit

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
        listView.listTableView.delegate = self
        listView.listTableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
}

// MARK: -
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
