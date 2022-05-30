//
//  DetailsContactsViewController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 28.05.22.
//

import UIKit

class DetailsContactsViewController: UIViewController {
    
    private lazy var detailsView: DetailsView = {
        guard let view = view else { return DetailsView() }
        return view as! DetailsView
    }()
    
    override func loadView() {
        view = DetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
