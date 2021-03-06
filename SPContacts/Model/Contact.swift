//
//  Contact.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 9.04.22.
//

import UIKit
import Contacts

// MARK: - Contact
final class Contact {
    
    // MARK: - Static Properties
    static let importNotificationName = Notification.Name(ConstantString.importContactNotificationName)
    
    // MARK: - Private Properties
    var identifier: String
    var name: String
    var middleName: String
    var familyName: String
    var emailAddresses: [CNLabeledValue<NSString>]
    var phoneNumbers: [CNLabeledValue<CNPhoneNumber>]
    var imageData: UIImage?
    
    // MARK: - Initialize
    init(contact: CNContact) {
        identifier = contact.identifier
        name = contact.givenName
        middleName = contact.middleName
        familyName = contact.familyName
        emailAddresses = contact.emailAddresses
        phoneNumbers = contact.phoneNumbers
        if let data = contact.imageData {
            imageData = UIImage(data: data)
        } else {
            imageData = UIImage(named:"PersonCircle")
        }
    }
    
    // MARK: - Public methods
    func getFullname() -> String {
        if name == "" {
            return familyName
        }
        if familyName == "" {
            return name
        }
        
        let settingsBundleHelper = SettingsBundleHelper()
        if settingsBundleHelper.sortOrder == .first {
            return "\(name) \(familyName)"
        } else {
            return "\(familyName) \(name)"
        }
    }
}

// MARK: - FetchableContacts
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
                           CNContactImageDataKey]
        return keysToFetch as [CNKeyDescriptor]
    }
}
