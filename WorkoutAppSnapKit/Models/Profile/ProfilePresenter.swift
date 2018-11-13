import UIKit
import RxCocoa
import RxSwift

final class ProfilePresenter {
    private let modelVariable = Variable(ProfileModel())

    private let interactor: ProfileInteractorInterface
    private let wireframe: ProfileWireframeInterface

    init(wireframe: ProfileWireframeInterface,
         interactor: ProfileInteractorInterface) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
}

extension ProfilePresenter: ProfilePresenterInterface {
    var viewModelDriver: Driver<ProfileViewModel> {
        return modelVariable
            .asDriver()
            .map { $0.viewModel }
    }

    func didTapSettingsButton() {
        wireframe.navigate(to: .editProfile)
    }
}
