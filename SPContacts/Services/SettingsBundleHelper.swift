//
//  SettingsBundleHelper.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 22.05.22.
//

import Foundation
import Contacts

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
    
    let isCanUseOfContacts: Bool = {
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        switch authorizationStatus {
        case .notDetermined:
            return true
        case .restricted:
            return false
        case .denied:
            return false
        case .authorized:
            return true
        @unknown default:
            return false
        }
    }()
}

enum SortOrderContact: String {
    case first = "First"
    case last = "Last"
}
