import RxSwift
import RxCocoa
import UIKit

final class ProfilePresenter {
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
        fatalError("TODO: implement viewModel driver")
    }
}
