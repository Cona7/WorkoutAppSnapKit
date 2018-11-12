import Foundation

final class ProfileInteractor {

    static let arrayTotal = [
        ProfileModel(name: "Total workouts"),
        ProfileModel(name: "Total reps")
    ]

    static let arrayMuscles = [
        ProfileModel(name: "Triceps"),
        ProfileModel(name: "Biceps"),
        ProfileModel(name: "Bench")
    ]
}

extension ProfileInteractor: ProfileInteractorInterface {
}
