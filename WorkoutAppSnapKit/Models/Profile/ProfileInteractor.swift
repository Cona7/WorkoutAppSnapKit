import Foundation

final class ProfileInteractor {

    static let arrayTotal = [
        ProfileCellModel(name: "Total workouts"),
        ProfileCellModel(name: "Total reps")
    ]

    static let arrayMuscles = [
        ProfileCellModel(name: "Triceps"),
        ProfileCellModel(name: "Biceps"),
        ProfileCellModel(name: "Bench")
    ]
}

extension ProfileInteractor: ProfileInteractorInterface {
}
