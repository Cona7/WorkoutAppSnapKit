import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barTintColor = .customBlue
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [.font: UIFont.setHelveticaNeue(textFont: 17), .foregroundColor: UIColor.white]
    }
}
