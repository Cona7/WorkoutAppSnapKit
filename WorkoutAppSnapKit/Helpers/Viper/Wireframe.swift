import UIKit

class Wireframe {
    unowned var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension Wireframe {
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

extension UINavigationController {

    func setRootWireframe(_ wireframe: Wireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
}
