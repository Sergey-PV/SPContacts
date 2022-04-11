//
//  ContactStore+Ex.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 11.04.22.
//

import Foundation
import Contacts

extension CNContactStore {
    func fetchContact<T: FetchableContacts>(on contact: T.Type,
                                       result: @escaping (Result<[T], Error>) -> Void) {
        let predicate = NSPredicate(value: true)
        do {
            let contacts = try self.unifiedContacts(matching: predicate,
                                                    keysToFetch: contact.getKeysToFetch())
            result(.success(contact.transformContacts(contacts)))
        } catch {
            result(.failure(error))
        }
    }
}
