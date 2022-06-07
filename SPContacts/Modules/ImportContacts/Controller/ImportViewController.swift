//
//  ImportViewController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 13.04.22.
//

import UIKit
import Contacts

// MARK: - Constants
private extension ConstantString {
    static let titleContactAccessAlertLocalized =
    NSLocalizedString("SPContacts cannot import your contacts",
                      comment: "")
    static let messegeContactAccessAlertLocalized =
    NSLocalizedString("Please give the app permission to import contacts. You can find this option in you device setting",
                      comment: "")
}

// MARK: - ImportViewController
class ImportViewController: UIViewController {
    
    // MARK: - UIElements
    private lazy var importView: ImportView = {
        guard let view = view else { return ImportView() }
        return view as! ImportView
    }()
    
    private lazy var contactAccessAlertController: UIAlertController = {
        let contactAccessAlertController = UIAlertController(title: ConstantString.titleContactAccessAlertLocalized,
                                                             message: ConstantString.messegeContactAccessAlertLocalized,
                                                             preferredStyle: .alert)
        contactAccessAlertController.addAction(settingAlertAction)
        contactAccessAlertController.addAction(cancelAlertAction)
        return contactAccessAlertController
    }()
    
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
    
    // MARK: - Lifecycle
    override func loadView() {
        view = ImportView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        importView.importButton.addTarget(self,
                                          action: #selector(importButtonTouchUpInside),
                                          for: .touchUpInside)
        importView.closeButton.addTarget(self,
                                         action: #selector(closeButtonTouchUpInside),
                                         for: .touchUpInside)
    }
    
    // MARK: - Private methods
    @objc private func importButtonTouchUpInside(button: UIButton) {
        let settingBundleHelper = SettingsBundleHelper()
        if !settingBundleHelper.isCanUseOfContacts {
            show(contactAccessAlertController, sender: nil)
            return
        }
        
        let contactStore = CNContactStore()
        contactStore.fetchContact(on: Contact.self) {[weak self] result in
            switch result {
            case .success(let contacts):
                NotificationCenter.default.post(name: Contact.importNotificationName, object: contacts)
                guard let self = self else { return }
                self.dismiss(animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc private func closeButtonTouchUpInside(button: UIButton) {
        dismiss(animated: true)
    }
}
