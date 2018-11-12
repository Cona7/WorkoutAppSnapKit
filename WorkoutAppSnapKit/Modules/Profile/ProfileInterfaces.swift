import RxCocoa
import UIKit

enum ProfileNavigationOption {
}

protocol ProfileWireframeInterface {
    func navigate(to option: ProfileNavigationOption)
}

protocol ProfilePresenterInterface {
    var viewModelDriver: Driver<ProfileViewModel> { get }
}

protocol ProfileInteractorInterface {
}
