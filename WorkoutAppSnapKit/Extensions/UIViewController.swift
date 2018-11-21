import UIKit

extension UIViewController {
    var topMostViewController: UIViewController {
        var viewController = self

        while let presentedViewController = viewController.presentedViewController {
            viewController = presentedViewController
        }

        if let viewController = viewController as? UINavigationController,
            let visibleViewController = viewController.visibleViewController {
            return visibleViewController.topMostViewController
        }

        if let viewController = viewController as? UITabBarController,
            let selectedViewController = viewController.selectedViewController {
            return selectedViewController.topMostViewController
        }

        return viewController
    }
}
