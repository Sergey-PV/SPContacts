//
//  ListViewController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 25.04.22.
//

import UIKit

// MARK: - Constants
private extension ConstantSize {
    static let heightOfRow: CGFloat = 45
}

class ListViewController: UIViewController {
    
    // MARK: - UIElements
    private lazy var listView: ListView = {
        guard let view = view else { return ListView() }
        return (view as! ListView)
    }()
    
    private lazy var contacts: [Contact] = [] {
        didSet {
            if areContactsSorted {
                areContactsSorted = false
            } else {
                sortingContact()
            }
            listView.listTableView.reloadData()
        }
    }
    
    // MARK: - Private properties
    private lazy var areContactsSorted = false

    // MARK: - Lifecycle
    override func loadView() {
        view = ListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ConstantColor.backgroud
        setNavigationViewController()
        listView.listTableView.delegate = self
        listView.listTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaults.standard.addObserver(self,
                                          forKeyPath: ConstantString.sortOrderIndetifier,
                                          context: nil)
        sortingContact()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getContacts()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == ConstantString.sortOrderIndetifier {
            sortingContact()
        }
    }

    // MARK: - Private methods
    private func setNavigationViewController() {
        title = ConstantString.contactsLocalized
        navigationController?.navigationBar.prefersLargeTitles = true
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

    private func sortingContact() {
        guard contacts.count > 1 else { return }
        areContactsSorted = true
        let settingsBundleHelper = SettingsBundleHelper()
        
        contacts = contacts.sorted(by: { firstContact, secondContact in
            switch settingsBundleHelper.sortOrder {
            case .first:
                guard firstContact.name < secondContact.name else { return false}
                return true
            case .last:
                guard firstContact.familyName < secondContact.familyName else { return false}
                return true
            }
        })
    }
    
    deinit {
        UserDefaults.standard.removeObserver(self,
                                             forKeyPath: ConstantString.sortOrderIndetifier)
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController()
        detailsViewController.contact = contacts[indexPath.row]
        show(detailsViewController, sender: nil)
    }
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
        cell.nameLable.text = contacts[indexPath.row].getFullname()
        cell.photoImageView.image = contacts[indexPath.row].imageData
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ConstantSize.heightOfRow
    }
}
