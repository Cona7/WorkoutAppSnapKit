import SnapKit
import UIKit

class EditProfileViewController: UIViewController {
    var presenter: EditProfilePresenterInterface!

    var imageView: UIImageView {
        let image = #imageLiteral(resourceName: "oval2")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    var textField: UITextField {
        let textField = UITextField()
        textField.delegate = self
        textField.layer.borderColor = UIColor.customBlue.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4
        textField.textColor = .customBlue
        textField.font = .setHelveticaNeue(textFont: 13)
        textField.setLeftPaddingPoints(14)
        return textField
    }

    var segmentedControl: UISegmentedControl {
        let segmentedControl = UISegmentedControl()
        segmentedControl.tintColor = .customBlue
        segmentedControl.layer.cornerRadius = 4
        return segmentedControl
    }

    lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.backgroundColor = .customBlue
        saveButton.layer.cornerRadius = 8
        saveButton.titleLabel?.font = UIFont(name: "SFProText-Medium", size: 17)
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.titleLabel?.textColor = .white
        return saveButton
    }()

    lazy var centarProfileImageView = imageView
    lazy var leftProfileImageView = imageView
    lazy var rightProfileImageView = imageView

    lazy var ageTextField = textField
    lazy var heightTextField = textField
    lazy var weightTextField = textField

    lazy var heightSegmentedControl = segmentedControl
    lazy var weightSegmentedControl = segmentedControl

    var imageViewTopConstraintChanged = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        view.backgroundColor = .white

        navigationItem.title = "EditProfile"

        ageTextField.placeholder = "AGE"
        heightTextField.placeholder = "HEIGHT"
        weightTextField.placeholder = "WEIGHT"

        heightSegmentedControl.insertSegment(withTitle: "inch", at: 0, animated: false)
        heightSegmentedControl.insertSegment(withTitle: "cm", at: 1, animated: false)
        heightSegmentedControl.selectedSegmentIndex = 0

        weightSegmentedControl.insertSegment(withTitle: "Ibs", at: 0, animated: false)
        weightSegmentedControl.insertSegment(withTitle: "kg", at: 1, animated: false)
        weightSegmentedControl.selectedSegmentIndex = 0

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        let tapGestrure = UITapGestureRecognizer(target: self, action: #selector(EditProfileViewController.dismissKeyboard))

        view.addGestureRecognizer(tapGestrure)

        addSubviews()
        layout()
    }

    func addSubviews() {
        view.addSubview(centarProfileImageView)
        view.addSubview(leftProfileImageView)
        view.addSubview(rightProfileImageView)

        view.addSubview(ageTextField)
        view.addSubview(heightTextField)
        view.addSubview(weightTextField)

        view.addSubview(heightSegmentedControl)
        view.addSubview(weightSegmentedControl)

        view.addSubview(saveButton)
    }

    func layout() { // swiftlint:disable:this function_body_length
        centarProfileImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(49)
            make.centerX.equalTo(view)
            make.height.equalTo(80)
            make.height.equalTo(centarProfileImageView.snp.width)
        }

        leftProfileImageView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(centarProfileImageView.snp.bottom).offset(0)
            make.trailing.equalTo(centarProfileImageView.snp.leading).offset(-24)
            make.width.equalTo(80)
            make.height.equalTo(centarProfileImageView.snp.width)
        }

        rightProfileImageView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(centarProfileImageView.snp.bottom).offset(0)
            make.leading.equalTo(centarProfileImageView.snp.trailing).offset(24)
            make.width.equalTo(80)
            make.height.equalTo(rightProfileImageView.snp.width)
        }

        ageTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(centarProfileImageView.snp.bottom).offset(48)
            make.height.equalTo(40)
            make.leading.equalTo(view).offset(40)
            make.trailing.equalTo(view).offset(-40)
        }

        heightTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(ageTextField.snp.leading).offset(2)
            make.trailing.equalTo(heightSegmentedControl.snp.leading).offset(-16)
            make.top.equalTo(ageTextField.snp.bottom).offset(24)
            make.height.equalTo(40)
        }

        weightTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(ageTextField.snp.leading).offset(2)
            make.trailing.equalTo(weightSegmentedControl.snp.leading).offset(-16)
            make.top.equalTo(heightTextField.snp.bottom).offset(24)
            make.height.equalTo(40)
        }

        heightSegmentedControl.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(heightTextField.snp.bottom).offset(0)
            make.height.equalTo(40)
            make.width.equalTo(115)
            make.trailing.equalTo(view).offset(-41)
        }

        weightSegmentedControl.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(weightTextField.snp.bottom).offset(0)
            make.height.equalTo(40)
            make.width.equalTo(115)
            make.trailing.equalTo(view).offset(-41)
        }

        saveButton.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(view).offset(-40)
            make.leading.equalTo(view).offset(40)
            make.trailing.equalTo(view).offset(-40)
            make.height.equalTo(50)
        }
    }

    @objc
    func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            keyboardSize.origin.y < (weightTextField.frame.origin.y + weightTextField.frame.height + view.frame.origin.y) {
            let constantToRaiseConstraint = keyboardSize.origin.y - weightTextField.frame.origin.y - weightTextField.frame.height - 20

            centarProfileImageView.snp.updateConstraints { (make) in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(constantToRaiseConstraint)
            }

            saveButton.snp.updateConstraints { (make) in
                make.bottom.equalTo(view).offset(constantToRaiseConstraint)
            }

            imageViewTopConstraintChanged = true

            view.layoutIfNeeded()
        }
    }

    @objc
    func keyboardWillHide(notification: Notification) {
        if imageViewTopConstraintChanged {
            centarProfileImageView.snp.updateConstraints { (make) -> Void in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(49)
            }

            saveButton.snp.updateConstraints { (make) -> Void in
                make.bottom.equalTo(view).offset(-40)
            }

            view.layoutIfNeeded()
        }
    }

    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension EditProfileViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

extension EditProfileViewController {
    func present(viewModel: EditProfileViewModel) {
    }
}
