import UIKit

final class EditProfileWireframe: Wireframe {
    static func setupModule() -> UIViewController {
        let viewController = EditProfileViewController(nibName: nil, bundle: nil)
        let wireframe = EditProfileWireframe(viewController: viewController)

        let interactor = EditProfileInteractor()
        let presenter = EditProfilePresenter(wireframe: wireframe, interactor: interactor)
        viewController.presenter = presenter

        return viewController
    }
}

extension EditProfileWireframe: EditProfileWireframeInterface {
    func navigate(to option: EditProfileNavigationOption) {
    }
}
