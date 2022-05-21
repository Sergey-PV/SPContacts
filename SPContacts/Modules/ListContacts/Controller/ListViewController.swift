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
    
    private lazy var contacts: [Contact] = [] {
        didSet {
            listView.listTableView.reloadData()
        }
    }
    
    override func loadView() {
        view = ListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ConstantColor.backgroud
        listView.listTableView.delegate = self
        listView.listTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getContacts()
    }
    
    private func getContacts() {
        if contacts.count == 0 {
            importContacts()
        }
    }
    
    private func importContacts() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateListTableView(notification:)),
                                               name: Contact.importNotificationName,
                                               object: nil)
        let importViewController = ImportViewController()
        importViewController.modalPresentationStyle = .popover
        self.present(importViewController, animated: true)
    }
    
    @objc private func updateListTableView(notification: Notification) {
        if let object = notification.object as? [Contact] {
            contacts = object
        }
        NotificationCenter.default.removeObserver(self,
                                                  name: Contact.importNotificationName,
                                                  object: nil)
    }
    
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantString.listCellId,
                                                 for: indexPath)
        guard let cell = cell as? ListTableViewCell else { return cell }
        cell.nameLable.text = contacts[indexPath.row].name + " " + contacts[indexPath.row].familyName
        cell.photoImageView.image = contacts[indexPath.row].imageData
        return cell
    }
}
