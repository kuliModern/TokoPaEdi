//
//  RegistViewController.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 23/09/21.
//

import UIKit

class RegistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

}
