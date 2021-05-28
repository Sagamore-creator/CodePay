//  Created by Lech Lipnicki on 2021-05-10.
//

import UIKit

typealias ViewTap = () -> Void

class SelectionView: UIView {
    var selectedValue: String? = ""
    private var onTap: ViewTap?

    // MARK: - Initializers

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(
        titleText: String?,
        selectedValue: String? = nil,
        onTap: ViewTap?
    ) {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        titleLabel.text = titleText
        selectedValueLabel.text = selectedValue
        tapGestureRecognizer.isEnabled = onTap != nil
        addGestureRecognizer(tapGestureRecognizer)
        self.onTap = onTap
    }

    func setSelectedValue(_ value: String?) {
        selectedValueLabel.text = value
        selectedValue = value
    }

    // MARK: - Gesture Recognizer

    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(handleTap))
    }()

    // MARK: - Actions

    @objc private func handleTap(sender: UITapGestureRecognizer) {
        guard let onTap = onTap else { return }
        fadeOut()
        fadeIn()
        performAction(onTap)
    }

    private func performAction(_ onTap: ViewTap? = nil) {
        onTap?()
    }

    // MARK: - View Components

    private let titleLabel: UILabel = {
        Label(color: .grayDark, font: .title)
    }()

    private let selectedValueLabel: UILabel = {
        Label(color: .grayDark, font: .body)
    }()

    private let arrowIconView: UIImageView = {
        let imageView = UIImageView()
        let configuration = UIImage.SymbolConfiguration(pointSize: 13, weight: .medium)
        imageView.image = UIImage(systemName: "chevron.right", withConfiguration: configuration)
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Configure View

    private func setupView() {
        addSubview(titleLabel)
        addSubview(selectedValueLabel)
        addSubview(arrowIconView)

        layer.cornerRadius = CornerRadiusSize.round.value
        backgroundColor = color(.lightGray)
        layer.borderWidth = BorderWidth
        layer.borderColor = color(.black)?.cgColor
        layer.masksToBounds = true
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.leading.equalTo(self).offset(10)
        }

        arrowIconView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.trailing.equalTo(self).inset(15)
        }

        selectedValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing)
            make.trailing.equalTo(arrowIconView.snp.leading).multipliedBy(0.98)
        }
    }
}
