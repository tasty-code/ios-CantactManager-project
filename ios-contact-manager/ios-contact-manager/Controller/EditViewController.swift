import UIKit

final class EditViewController: UIViewController {
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var indexPathLabel: UILabel!
    
    weak var delegate: ContactsManagable?
    var contact: Contact?
    var indexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        contactNameLabel.text? = contact?.name ?? "새로운 연락처"
        indexPathLabel.text? = "\(indexPath?.row ?? 0)"
    }
    
    @IBAction private func touchSaveBarButton(sender: UIBarButtonItem) {
        delegate?.updateContact(contact!, indexPath!)
    }
}
