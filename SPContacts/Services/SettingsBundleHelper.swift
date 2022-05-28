//
//  SettingsBundleHelper.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 22.05.22.
//

import Foundation

struct SettingsBundleHelper {
    let sortOrder: SortOrderContact = {
        let sortOrder = UserDefaults.standard.string(forKey: ConstantString.sortOrderIndetifier)
        switch sortOrder {
        case SortOrderContact.first.rawValue:
            return SortOrderContact.first
        case SortOrderContact.last.rawValue:
            return SortOrderContact.last
        default:
            return SortOrderContact.first
        }
    }()
}

enum SortOrderContact: String {
    case first = "First"
    case last = "Last"
}
