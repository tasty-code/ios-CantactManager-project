//
//  TableViewController.swift
//  ios-contact-manager-ui
//
//  Created by Swain Yun on 10/4/23.
//

import UIKit

final class TableViewController: UITableViewController {
    private let contactsModel: ContactsModel = ContactsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = self.contactsModel.readContact(indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(contact.name)(\(contact.age))"
        content.secondaryText = "\(contact.phoneNumber)"
        cell.contentConfiguration = content
        return cell
    }

//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // delete contact
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // create contact
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // on change contact row
    }

//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    @IBAction func touchAddButton(_ sender: UIBarButtonItem) {
        pushToEditViewContoller(nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = self.contactsModel.readContact(indexPath)
        pushToEditViewContoller(contact)
    }
    
    
    private func pushToEditViewContoller(_ contact: Contact?) {
        guard let editViewController = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController else { return }
        
        editViewController.contact = contact
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
}

extension TableViewController: ContactsManagable {
    func createContact(_ contact: Contact) {
        contactsModel.createContact(contact)
    }
    
    func updateContact(_ contact: Contact) {
        contactsModel.updateContact(contact)
    }
}
