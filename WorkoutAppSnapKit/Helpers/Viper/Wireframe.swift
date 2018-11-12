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

extension UIViewController {
    func presentWireframe(_ wireframe: Wireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
}

extension UINavigationController {
    func pushWireframe(_ wireframe: Wireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }

    func setRootWireframe(_ wireframe: Wireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
}
