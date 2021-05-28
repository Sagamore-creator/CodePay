//  Created by Lech Lipnicki on 2021-05-07.
//

import UIKit
import SnapKit

final class Currency {
    let title: String
    var isSelected: Bool

    init(title: String, isSelected: Bool = false) {
        self.title = title
        self.isSelected = isSelected
    }
}

final class CurrencyTableViewController: TableViewController {
    var onCurrencySelect: ((_ pass: String) -> Void)?
    private var currencyArray: [Currency] = []

    deinit {
        print("CURRENCY SELECTION SCENE - DEINITED")
    }

    // MARK: - Initializers

    init(with currency: [Currency]) {
        super.init(nibName: nil, bundle: nil)
        currencyArray = currency
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose currency"
        tableView.register(SelectionCell.self, forCellReuseIdentifier: "SelectionCell")
        tableView.tableFooterView = UIView()
    }

    // MARK: - UITableViewDataSource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencyArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionCell", for: indexPath)
        let currency = currencyArray[indexPath.row]

        guard let currencyCell = cell as? SelectionCell else {
            return cell
        }

        currencyCell.configureCell(with: currency.title)

        currencyCell.accessoryType = currency.isSelected ? .checkmark : .none
        return currencyCell
    }


    // MARK: - UITableViewDelegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = currencyArray[indexPath.row].title
        currencyArray[indexPath.row].isSelected.toggle()
        onCurrencySelect?(title)
        selectRow(with: title)
        deselectRows(without: title)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate helpers

private extension CurrencyTableViewController {

    func selectRow(with title: String?) {
        currencyArray.first(where: { $0.title == title})?.isSelected = true
    }

    func deselectRows(without title: String?) {
        for currency in currencyArray where currency.title != title {
            currency.isSelected = false
        }
    }
}
