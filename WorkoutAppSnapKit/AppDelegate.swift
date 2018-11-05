import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let viewController = ProfileViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.navigationBar.barStyle = .black

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        UINavigationBar.appearance().barTintColor = .customBlue
        UINavigationBar.appearance().backgroundColor = .customBlue

        return true
    }
}
