//
//  DetailsViewController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 28.05.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var contact: Contact?
    
    private lazy var detailsView: DetailsView = {
        guard let view = view else { return DetailsView() }
        return view as! DetailsView
    }()
    
    override func loadView() {
        view = DetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.detailsTableView.backgroundColor = .blue
        detailsView.detailsTableView.delegate = self
        detailsView.detailsTableView.dataSource = self
    }
    
}

extension DetailsViewController: UITableViewDelegate {
    
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let contact = contact else { return 0 }
        switch section {
        case 0:
            return contact.phoneNumbers.count
        case 1:
            return contact.emailAddresses.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableDetailsCell(withIdentifier: ConstantString.detailsCellId,
                                                        for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.titleLable.text = contact?.phoneNumbers[indexPath.row].label
            cell.infoTextField.text = contact?.phoneNumbers[indexPath.row].value.stringValue
        case 1:
            cell.titleLable.text = contact?.emailAddresses[indexPath.row].label
            cell.infoTextField.text = contact?.emailAddresses[indexPath.row].value as? String
        default:
            return cell
        }
        return cell
    }
    
}
