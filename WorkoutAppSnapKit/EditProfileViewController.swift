import SnapKit
import UIKit

class EditProfileViewController: UIViewController {

    lazy var profileImageView: UIImageView = {
        let image = #imageLiteral(resourceName: "oval2")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationItem.title = "EditProfile"

        view.addSubview(profileImageView)

        profileImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(49)
            make.centerX.equalTo(view)
            make.height.equalTo(80)
            make.height.equalTo(profileImageView.snp.width)
        }
    }
}
