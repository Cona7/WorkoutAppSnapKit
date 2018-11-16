import UIKit
import RxCocoa
import RxSwift

final class ProfilePresenter {
    let disposeBag = DisposeBag()

    private let modelVariable = Variable(ProfileModel())

    private let interactor: ProfileInteractorInterface
    private let wireframe: ProfileWireframeInterface

    init(wireframe: ProfileWireframeInterface,
         interactor: ProfileInteractorInterface) {
        self.wireframe = wireframe
        self.interactor = interactor

        fetchArrayTotal()
        fetchArrayMuscles()
    }
}

extension ProfilePresenter: ProfilePresenterInterface {
    var viewModelDriver: Driver<ProfileViewModel> {
        return modelVariable
            .asDriver()
            .map { $0.viewModel }
    }

    func fetchArrayTotal() {
        interactor
            .fetchArrayTotal()
            .subscribe(
                onNext: { [unowned self] value in
                    self.modelVariable.value.arrayTotal = value
                }
            )
            .disposed(by: disposeBag)
    }

    func fetchArrayMuscles() {
        interactor
            .fetchArrayMuscles()
            .subscribe(
                onNext: { [unowned self] value in
                    self.modelVariable.value.arrayMuscles = value
                }
            )
            .disposed(by: disposeBag)
    }
    func didTapSettingsButton() {
        wireframe.navigate(to: .editProfile)
    }
}
