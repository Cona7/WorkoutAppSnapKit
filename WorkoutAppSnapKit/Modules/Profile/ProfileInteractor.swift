import Foundation
import RxSwift

final class ProfileInteractor {
    let arrayTotal = [
        ProfileCellModel(name: "Total Workouts"),
        ProfileCellModel(name: "Total Reps")
    ]

    var arrayMuscles = [
        ProfileCellModel(name: "Triceps"),
        ProfileCellModel(name: "Biceps"),
        ProfileCellModel(name: "Bench")
    ]
}

extension ProfileInteractor: ProfileInteractorInterface {
    func fetchArrayTotal() -> Observable<[ProfileCellModel]> {
        return .just(arrayTotal)
    }

    func fetchArrayMuscles() -> Observable<[ProfileCellModel]> {
        return .just(arrayMuscles)
    }
}
