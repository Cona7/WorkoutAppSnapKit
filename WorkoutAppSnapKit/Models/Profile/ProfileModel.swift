struct ProfileCellModel {
    let name: String
    let number = "8545"
}

struct ProfileModel {
    var viewModel: ProfileViewModel {
        return ProfileViewModel(
            username: "Username",
            userImage: #imageLiteral(resourceName: "oval2")
        )
    }
}
