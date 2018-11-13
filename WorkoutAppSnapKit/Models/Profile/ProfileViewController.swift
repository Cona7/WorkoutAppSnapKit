import UIKit
import SnapKit
import RxSwift

class ProfileViewController: UIViewController {
    var presenter: ProfilePresenterInterface!

    let disposeBag = DisposeBag()

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .setHelveticaNeue(textFont: 19)
        label.textAlignment = .center
        return label
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TypeViewCell.self, forCellReuseIdentifier: "TypeViewCell")
        tableView.rowHeight = 48
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0.0
        tableView.backgroundColor = .white
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        view.backgroundColor = .white

        navigationItem.title = "Profile"

        let menuBtn = UIButton(type: .custom)
        menuBtn.setImage(#imageLiteral(resourceName: "iconSettings"), for: .normal)
        menuBtn.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)

        let settingsBarItem = UIBarButtonItem(customView: menuBtn)
        navigationItem.rightBarButtonItem = settingsBarItem

        presenter
            .viewModelDriver
            .drive(
                onNext: { [weak self] viewModel in
                    self?.present(viewModel: viewModel)
                }
            ).disposed(by: disposeBag)

        addSubviews()
        layout()
    }

    func present(viewModel: ProfileViewModel) {
        usernameLabel.text = viewModel.username
        usernameLabel.letterSpace = 2.2
        profileImageView = UIImageView(image: viewModel.userImage)
    }

    func addSubviews() {
        view.addSubview(profileImageView)
        view.addSubview(usernameLabel)
        view.addSubview(tableView)
    }

    func layout() {
        profileImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalTo(view)
            make.height.equalTo(140)
            make.height.equalTo(profileImageView.snp.width)
        }

        usernameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.centerX.equalTo(view)
        }

        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(usernameLabel.snp.bottom).offset(15)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 6.0
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return ProfileInteractor.arrayTotal.count
        case 1:
            return ProfileInteractor.arrayMuscles.count
        default:
            fatalError("The section number is not valid")
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TypeViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TypeViewCell else {
            fatalError("The dequeued cell is not an instance of TypeViewCell.")
        }

        let workoutCell: ProfileCellModel

        switch indexPath.section {
        case 0:
            workoutCell = ProfileInteractor.arrayTotal[indexPath.row]
        case 1:
            workoutCell = ProfileInteractor.arrayMuscles[indexPath.row]
        default:
            fatalError("The section number is not valid")
        }

        cell.stringLabel.text = workoutCell.name
        cell.numberLabel.text = workoutCell.number
        cell.stringLabel.letterSpace = 0.4
        cell.numberLabel.letterSpace = 0.4

        return cell
    }
}

extension ProfileViewController {

    @objc
    func didTapSettingsButton() {
        presenter.didTapSettingsButton()
    }
}