//  Created by Lech Lipnicki on 2021-05-11.
//

import UIKit

final class SelectionCell: TableViewCell {

    func configureCell(with text: String?) {
        let cellLabel = Label(
            text: text,
            color: .grayDark,
            font: .title
        )

        contentView.addSubview(cellLabel)

        contentView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        cellLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView).offset(20)
        }
    }
}
