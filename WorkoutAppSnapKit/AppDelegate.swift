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

        ApplicationManager.shared = ApplicationManager(window: window!)
        ApplicationManager.shared?.setRootViewController()

        window?.makeKeyAndVisible()

        return true
    }
}
