//
//  ProductDetailsViewController.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 18/10/21.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPhoto: UIImageView!
    @IBOutlet weak var productDetail: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productStock: UILabel!
    
    
    var productNames = ""
    var productDetails = ""
    var productPrices = ""
    var productStocks: Int  = 0
    var productPhotos: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.\
        updateUI()
    }
    
    func updateUI(){
        
        productName.text = productNames
        productDetail.text = productDetails
        productPrice.text = productPrices
        productStock.text = "\(productStocks)"
        productPhoto.image = productPhotos
    }
    
    @IBAction func addToCartButton(_ sender: UIButton) {
        
        productStocks -= 1
        productStocks - 1
        productStock.text = "\(productStocks)"
        
    }
    
    
}
