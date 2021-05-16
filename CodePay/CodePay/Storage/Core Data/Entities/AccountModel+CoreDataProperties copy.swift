//  Created by Lech Lipnicki on 2021-05-16.
//
//

import Foundation
import CoreData

extension AccountModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountModel> {
        return NSFetchRequest<AccountModel>(entityName: "AccountModel")
    }
    @NSManaged public var id: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var currency: String?
    @NSManaged public var balance: NSDecimalNumber?
    @NSManaged public var transactions: NSSet?
}

// MARK: Generated accessors for transactions

extension AccountModel {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: TransactionModel)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: TransactionModel)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)
}
