//
//  EditViewController.swift
//  ios-contact-manager-ui
//
//  Created by Swain Yun on 10/4/23.
//

import UIKit

protocol ContactsManagable {
    func updateContact(_ contact: Contact)
    
    func createContact(_ contact: Contact)
}

final class EditViewController: UIViewController {
    
    @IBOutlet weak var contactNameLabel: UILabel!
    
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        contactNameLabel.text? = contact?.name ?? "새로운 연락처"
    }
}
