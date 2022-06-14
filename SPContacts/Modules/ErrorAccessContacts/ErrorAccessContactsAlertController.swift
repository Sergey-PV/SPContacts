//
//  ErrorAccessContactsAlertController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 14.06.22.
//

import UIKit

// MARK: - Constants
private extension ConstantString {
    static let titleContactAccessAlertLocalized =
    NSLocalizedString("SPContacts cannot import your contacts",
                      comment: "")
    static let messageContactAccessAlertLocalized =
    NSLocalizedString("Please give the app permission to import contacts. You can find this option in you device setting",
                      comment: "")
}

// MARK: - ErrorAccessContactsAlertController
class ErrorAccessContactsAlertController: UIAlertController {

    // MARK: - Private properties
    private lazy var cancelAlertAction = UIAlertAction(title: ConstantString.cancelLocalized,
                                                       style: .cancel)
    
    private lazy var settingAlertAction = UIAlertAction(title: ConstantString.settingLocalized,
                                                        style: .default) { _ in
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    
    convenience init(){
        self.init(nibName: nil, bundle: nil)
        title = ConstantString.titleContactAccessAlertLocalized
        message = ConstantString.messageContactAccessAlertLocalized
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addAction(settingAlertAction)
        addAction(cancelAlertAction)

    }
}
