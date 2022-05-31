//
//  UITableViewCell+Ex.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 31.05.22.
//

import UIKit

extension UITableView {
    
    func dequeueReusableDetailsCell(withIdentifier identifier: String, for indexPath: IndexPath) -> DetailsTableViewCell {
        
        guard let detailsCell = dequeueReusableCell(withIdentifier: identifier,
                                                    for: indexPath) as? DetailsTableViewCell
        else {
            return DetailsTableViewCell()
        }
        return detailsCell
    }
}
