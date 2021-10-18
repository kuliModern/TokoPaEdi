//
//  SellerProduct+CoreDataProperties.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 18/10/21.
//
//

import Foundation
import CoreData


extension SellerProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SellerProduct> {
        return NSFetchRequest<SellerProduct>(entityName: "SellerProduct")
    }

    @NSManaged public var customerName: String?
    @NSManaged public var product: String?
    @NSManaged public var productDate: Date?
    @NSManaged public var sellerName: String?
    @NSManaged public var productPrice: String?
    @NSManaged public var productDescription: String?

}

extension SellerProduct : Identifiable {

}
