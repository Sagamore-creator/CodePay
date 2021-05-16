//  Created by Lech Lipnicki on 2021-05-09.
//

import UIKit
import SnapKit

final class HomeViewController: ViewController {
    private var loggedInUser = UserDefaultsManager().getLoggedInUser()

    deinit {
        print("HomeViewController DEINITED")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME SCENE"
        navigationController?.navigationBar.isHidden = false

        print(loggedInUser)
    }
}
