//  Created by Lech Lipnicki on 2021-05-09.
//

import UIKit
import SnapKit

final class HomeViewController: ViewController {
    private var loggedInUser = UserDefaultsManager().getLoggedInUser()

    deinit {
        print("HOME SCENE - DEINITED")
    }

    private lazy var image: UIImageView = {
        UIImageView(image: Icon.underConstruction.image)
    }()

    private lazy var components: [UIView] = {
        [image]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupView(with views: [UIView]) {
        super.setupView(with: components)
        navigationController?.navigationBar.isHidden = true
        title = loggedInUser?.phoneNumber
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func setupConstraints() {
        super.setupConstraints()

        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(150)
            make.height.equalTo(200)
            make.width.equalTo(image.snp.height)
            make.centerX.equalTo(view)
        }
    }
}
