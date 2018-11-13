import UIKit

final class EditProfilePresenter {
    private let interactor: EditProfileInteractorInterface
    private let wireframe: EditProfileWireframeInterface

    init(wireframe: EditProfileWireframeInterface,
         interactor: EditProfileInteractorInterface) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
}

extension EditProfilePresenter: EditProfilePresenterInterface {
}
