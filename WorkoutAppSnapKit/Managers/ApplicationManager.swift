import UIKit

enum Environment {
    case staging
    case production
}

class ApplicationManager {
    static var shared: ApplicationManager!

    let environment = Environment.production

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window

        setupApperance()
    }

    func setRootViewController() {
        let viewController = rootViewController()

        if window.rootViewController?.topMostViewController != nil {
            UIView.setAnimationsEnabled(false)

            UIView.transition(
                with: window,
                duration: 0.5,
                options: .transitionCrossDissolve,
                animations: {
                    self.window.rootViewController = viewController
                },
                completion: { _ in
                    UIView.setAnimationsEnabled(true)
                }
            )
        } else {
            window.rootViewController = viewController
        }
    }

    private func rootViewController() -> UIViewController {
        let viewController = ProfileWireframe.setupModule()
        return NavigationController(rootViewController: viewController)
    }

    private func setupApperance() {
        window.backgroundColor = .white
    }
}
