//
//  ProfileViewController.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 27/09/21.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var sellerName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        
        do {
            let result = try context.fetch(SellerProduct.fetchRequest())
            
            for data in result as [NSManagedObject]{
                sellerName = data.value(forKey: "sellerName") as! String
                
            }
            
            userName.text = sellerName
        }
        catch {
             print("error")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
