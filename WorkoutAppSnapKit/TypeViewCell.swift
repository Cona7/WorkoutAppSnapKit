import UIKit
import SnapKit

class TypeViewCell: UITableViewCell {

    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customBlue
        label.font = .setHelveticaNeue(textFont: 17)
        label.textAlignment = .right
        return label
    }()

    lazy var stringLabel: UILabel = {
        let label = UILabel()
        label.font = .setHelveticaNeue(textFont: 17)
        return label
    }()

    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        return lineView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stringLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(lineView)

        stringLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(14)
            make.height.equalTo(28)
        }

        numberLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(stringLabel.snp.bottom).offset(0)
            make.top.equalTo(stringLabel.snp.top).offset(0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }

        lineView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(contentView.snp.bottom).offset(0)
            make.trailing.equalTo(contentView.snp.trailing).offset(0)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.height.equalTo(1)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
