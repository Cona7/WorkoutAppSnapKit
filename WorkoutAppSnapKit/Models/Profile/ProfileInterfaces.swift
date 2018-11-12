import UIKit

enum ProfileNavigationOption {
    case editProfile
}

protocol ProfileWireframeInterface {
    func navigate(to option: ProfileNavigationOption)
}

protocol ProfilePresenterInterface {
    func didTapSettingsButton()
}

protocol ProfileInteractorInterface {
}
