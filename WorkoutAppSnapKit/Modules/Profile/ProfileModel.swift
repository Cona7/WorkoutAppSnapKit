struct ProfileCellModel {
    let name: String
    let number = "8545"
}

struct ProfileModel {
    var arrayTotal: [ProfileCellModel] = []
    var arrayMuscles: [ProfileCellModel] = []

    var viewModel: ProfileViewModel {
        return ProfileViewModel (
            username: "Username",
            userImage: #imageLiteral(resourceName: "oval2"),
            arrayTotal: arrayTotal,
            arrayMuscles: arrayMuscles
        )
    }
}
