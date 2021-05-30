
import UIKit

class SecondVC: UIViewController {
    @IBOutlet weak var loginlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {

        let alertController = UIAlertController(title: nil, message: "bye", preferredStyle: UIAlertController.Style.alert)
        let onAction = UIAlertAction(title:"확인", style: UIAlertAction.Style.destructive, handler:nil )
        alertController.addAction(onAction)
        present(alertController, animated: true, completion: nil)

    }
    func someHandler(alert: UIAlertAction!) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
