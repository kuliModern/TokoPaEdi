//
//  RegistViewController.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 23/09/21.
//

import UIKit
import CoreData

class RegistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //deleteData()
    }
    

    @IBAction func sellerDidTap(_ sender: UIButton) {
        
        // go to the Seller Page
        
        let storyboard = UIStoryboard(name: "RegistStoryBoard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "nameVC") as! NameRegistViewController
             
        vc.seller = true
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func customerDidTap(_ sender: UIButton) {
        
        // go to the Customer Page
        
        let storyboard = UIStoryboard(name: "RegistStoryBoard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "nameVC") as! NameRegistViewController
             
        vc.seller = false
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
    
    // Delete Value Core Data-nya 
    func deleteData() {
        let appDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SellerProduct")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for managedObject in results {
                if let managedObjectData: NSManagedObject = managedObject as? NSManagedObject {
                    context.delete(managedObjectData)
                }
            }
        } catch let error as NSError {
            print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
        }
    }
    

}
