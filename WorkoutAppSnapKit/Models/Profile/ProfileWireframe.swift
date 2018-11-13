import UIKit

final class ProfileWireframe: Wireframe {
    static func setupModule() -> UIViewController {
        let viewController = ProfileViewController(nibName: nil, bundle: nil)
        let wireframe = ProfileWireframe(viewController: viewController)

        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(wireframe: wireframe, interactor: interactor)
        viewController.presenter = presenter

        return viewController
    }
}

extension ProfileWireframe: ProfileWireframeInterface {
    func navigate(to option: ProfileNavigationOption) {
        switch option {
        case .editProfile:
            if let navigator = navigationController {
                navigator.pushViewController(EditProfileWireframe.setupModule(), animated: true)
            }
        }
    }
}