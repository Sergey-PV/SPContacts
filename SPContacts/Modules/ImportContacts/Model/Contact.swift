//
//  Contact.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 9.04.22.
//

import UIKit
import Contacts

struct Contact {
    var name: String
    var middleName: String
    var familyName: String
    var emailAddresses: [String]
    var phoneNumbers: [CNLabeledValue<CNPhoneNumber>]
    var birtday: DateComponents?
    var imageData: UIImage
    var thumbnailImageData: UIImage
}
