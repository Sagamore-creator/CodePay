//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

class CPTableViewCell: UITableViewCell, CPReusableView {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {}
    func setupConstraints() {}

    func roundTopCorners() {
        contentView.layer.cornerRadius = 8
        contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

    func roundBottomCorners() {
        contentView.layer.cornerRadius = 8
        contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    func roundAllCorners() {
        contentView.layer.cornerRadius = 8
        contentView.layer.maskedCorners = [
            .layerMaxXMinYCorner,
            .layerMinXMinYCorner,
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
    }

    func removeRounding() {
        contentView.layer.cornerRadius = 0
    }
}
