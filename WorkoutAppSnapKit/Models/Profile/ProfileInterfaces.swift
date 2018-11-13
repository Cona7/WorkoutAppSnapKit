import UIKit
import RxCocoa

enum ProfileNavigationOption {
    case editProfile
}

protocol ProfileWireframeInterface {
    func navigate(to option: ProfileNavigationOption)
}

protocol ProfilePresenterInterface {
    var viewModelDriver: Driver<ProfileViewModel> { get }

    func didTapSettingsButton()
}

protocol ProfileInteractorInterface {
}
