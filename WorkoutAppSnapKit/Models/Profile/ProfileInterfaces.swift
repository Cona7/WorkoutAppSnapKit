import UIKit
import RxCocoa
import RxSwift

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
    func fetchArrayTotal() -> Observable<[ProfileCellModel]>
    func fetchArrayMuscles() -> Observable<[ProfileCellModel]>
}
