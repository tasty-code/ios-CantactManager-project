import UIKit

final class EditViewController: UIViewController {
    
    @IBOutlet weak var contactNameLabel: UILabel!
    
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        contactNameLabel.text? = contact?.name ?? "새로운 연락처"
    }
}
