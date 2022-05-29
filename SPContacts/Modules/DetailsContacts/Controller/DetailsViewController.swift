//
//  DetailsViewController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 28.05.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private lazy var detailsView: DetailsView = {
        guard let view = view else { return DetailsView() }
        return view as! DetailsView
    }()
    
    private lazy var detailsTableView: UITableView = {
        let detailsTableView = UITableView()
        detailsTableView.translatesAutoresizingMaskIntoConstraints = false
        return detailsTableView
    }()
    
    override func loadView() {
        view = DetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
