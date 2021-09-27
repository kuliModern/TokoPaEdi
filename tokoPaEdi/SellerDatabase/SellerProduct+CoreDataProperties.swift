//
//  SellerProduct+CoreDataProperties.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 27/09/21.
//
//

import Foundation
import CoreData


extension SellerProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SellerProduct> {
        return NSFetchRequest<SellerProduct>(entityName: "SellerProduct")
    }

    @NSManaged public var product: String?
    @NSManaged public var productDate: Date?
    @NSManaged public var sellerName: String?
    @NSManaged public var customerName: String?

}

extension SellerProduct : Identifiable {

}
