import UIKit
import Crashlytics
import Fabric

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])

        let viewController = ProfileWireframe.setupModule()
        let navigationController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        UINavigationBar.appearance().barTintColor = .customBlue
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.setHelveticaNeue(textFont: 17), .foregroundColor: UIColor.white]

        return true
    }
}
