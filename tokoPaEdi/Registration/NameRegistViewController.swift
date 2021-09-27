//
//  NameRegistViewController.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 23/09/21.
//

import UIKit

class NameRegistViewController: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var seller = true
    private var model = [SellerProduct]()
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var sellerName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonDidPressed(_ sender: UIButton) {
        
        guard sellerName.text != nil else {return}
        saveButton()
        
    }
    func buttonUI(){
        if seller == true{
            button.setTitle("Start Selling", for: .normal)
        }else{
            button.setTitle("Start Ordering", for: .normal)
        }
    }

    func saveButton(){
        
        let sellerNameCoreData = SellerProduct(context: context)
        guard let sellerName = sellerName.text else { return }
        
        sellerNameCoreData.sellerName = sellerName
        
        do {
            try context.save()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "sellerProductVC") as! ViewController
            
            self.navigationController?.pushViewController(vc
                                                          , animated: true)
            
            
        }
        catch{
            print("error save seller name")
        }
        
        
        
    }
   

}
