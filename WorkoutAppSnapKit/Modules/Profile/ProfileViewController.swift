import UIKit

final class ProfileViewController: ViewController {
    var presenter: ProfilePresenterInterface!

    override func setupViewController() {
        super.setupViewController()

        presenter
            .viewModelDriver
            .drive(
                onNext: { [weak self] viewModel in
                    self?.present(viewModel: viewModel)
                }
            ).disposed(by: disposeBag)
    }
}

extension ProfileViewController {
    func present(viewModel: ProfileViewModel) {
    }
}
