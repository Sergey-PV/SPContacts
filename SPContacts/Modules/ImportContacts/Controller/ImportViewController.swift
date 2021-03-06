//
//  ImportViewController.swift
//  SPContacts
//
//  Created by Sergey Parfentchik on 13.04.22.
//

import UIKit
import Contacts



// MARK: - ImportViewController
class ImportViewController: UIViewController {
    
    // MARK: - UIElements
    private lazy var importView: ImportView = {
        guard let view = view else { return ImportView() }
        return view as! ImportView
    }()
    
    private lazy var contactAccessAlertController = ErrorAccessContactsAlertController()
    
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
