import Foundation
import RxSwift

final class ProfileInteractor: ProfileInteractorInterface {
    let arrayTotal = [
        ProfileCellModel(name: "Total Workouts"),
        ProfileCellModel(name: "Total Reps")
    ]

    var arrayMuscles = [
        ProfileCellModel(name: "Triceps"),
        ProfileCellModel(name: "Biceps"),
        ProfileCellModel(name: "Bench")
    ]

    func fetchArrayTotal() -> Observable<[ProfileCellModel]> {
        return .just(arrayTotal)
    }

    func fetchArrayMuscles() -> Observable<[ProfileCellModel]> {
        return .just(arrayMuscles)
    }
}
