//  Created by Lech Lipnicki on 2021-05-16.
//
//

import Foundation
import CoreData

extension TransactionModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionModel> {
        return NSFetchRequest<TransactionModel>(entityName: "TransactionModel")
    }
    @NSManaged public var id: String?
    @NSManaged public var senderId: String?
    @NSManaged public var receiverId: String?
    @NSManaged public var amount: NSDecimalNumber?
    @NSManaged public var currency: String?
    @NSManaged public var createdOn: Int32
    @NSManaged public var reference: String?
    @NSManaged public var account: AccountModel?
}
