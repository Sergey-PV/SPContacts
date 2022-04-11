//
//  Contact.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 9.04.22.
//

import UIKit
import Contacts

struct Contact {
    let identifier: String
    var name: String
    var middleName: String
    var familyName: String
    var emailAddresses: [CNLabeledValue<NSString>]
    var phoneNumbers: [CNLabeledValue<CNPhoneNumber>]
    var birtday: DateComponents?
    var imageData: UIImage?
    var thumbnailImageData: UIImage?
    
    init(contact: CNContact) {
        identifier = contact.identifier
        name = contact.givenName
        middleName = contact.middleName
        familyName = contact.familyName
        emailAddresses = contact.emailAddresses
        phoneNumbers = contact.phoneNumbers
        birtday = contact.birthday
        if let data = contact.imageData {
            imageData = UIImage(data: data)
        }
        if let data = contact.thumbnailImageData {
            thumbnailImageData = UIImage(data: data)
        }
    }
}

extension Contact: FetchableContacts {
    static func transformContacts(_ contacts: [CNContact]) -> [Contact] {
        var thisConctacts: [Contact] = []
        for contact in contacts {
            let thisContact = Contact.init(contact: contact)
            thisConctacts.append(thisContact)
        }
        return thisConctacts
    }
    
    static func getKeysToFetch() -> [CNKeyDescriptor] {
        let keysToFetch = [CNContactIdentifierKey,
                           CNContactGivenNameKey,
                           CNContactMiddleNameKey,
                           CNContactFamilyNameKey,
                           CNContactEmailAddressesKey,
                           CNContactPhoneNumbersKey,
                           CNContactBirthdayKey,
                           CNContactImageDataKey,
                           CNContactThumbnailImageDataKey]
        return keysToFetch as [CNKeyDescriptor]
    }
}
