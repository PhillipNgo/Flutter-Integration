import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet var listLabel: UILabel!
    var favoritesList: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        listLabel.text = favoritesList.joined(separator: "\n")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listLabel.lineBreakMode = .byWordWrapping
        listLabel.numberOfLines = 0
    }
}
