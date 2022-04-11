//
//  GettableKeys.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 11.04.22.
//

import Foundation
import Contacts

protocol FetchableContacts {
    static func getKeysToFetch() -> [CNKeyDescriptor]
    static func transformContacts(_ contacts: [CNContact]) -> [Self]
}
