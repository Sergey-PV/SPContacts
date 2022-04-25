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
        let contactStore = CNContactStore()
        do {
            var contacts: [CNContact] = []
            let contactFetchRequest = CNContactFetchRequest(keysToFetch: T.getKeysToFetch())
            try contactStore.enumerateContacts(with: contactFetchRequest, usingBlock: { contact, _ in
                contacts.append(contact)
            })
            result(.success(contact.transformContacts(contacts)))
        } catch {
            result(.failure(error))
        }
    }
}
