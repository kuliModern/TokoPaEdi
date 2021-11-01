//
//  ViewController.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 21/09/21.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Table View
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    private var models = [SellerProduct]()
    
    var seller = true
    var customerName = ""
    var sellerName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
        navigationController()
        getAllItem()
        getName()
        updateUI()
        
        // deleteAllData(entity: "SellerProduct")

        // Do any additional setup after loading the view.
    }
    
    // navigation controller
    
    func navigationController(){
        let image = UIImage(systemName: "person.circle")
        let cart = UIImage(systemName: "cart")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if seller == true{
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(profileButton)
            )
            navigationItem.leftBarButtonItem?.isEnabled = true
        }
        else{
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: cart, style: .plain, target: self, action: #selector(cartButtonPressed))
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(profileButton))
            navigationItem.leftBarButtonItem?.isEnabled = true
        }
        
        
    }
  
     
    func updateUI(){
        if seller == true{
            title = "Your Product Catalogue"
        }
        else{
            title = "Welcome, \(customerName)"
        }
        
    }
    
    @objc func cartButtonPressed(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "userCart") as! UserCartViewController
     
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @objc func didTapAdd(){
        
        let alert = UIAlertController(title: "New Product", message: "Enter New Product", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit new Product", style: .cancel, handler: { [weak self] _ in
            
            guard let fieldname = alert.textFields?.first, let text = fieldname.text, !text.isEmpty else{
                return
            }
            
            self?.createItem(name: text)
            
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @objc func profileButton(){
        //self.navigationController?.popToRootViewController(animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        if seller == true{
            vc.sellerName = sellerName
        }
        else{
            vc.sellerName = customerName
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    //Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     
    
        cell.textLabel?.text = model.product
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productDetail") as! ProductDetailsViewController
        let item = models[indexPath.row]
        
        if seller == true{
            let sheet = UIAlertController(title: item.product, message: nil, preferredStyle: .actionSheet)
            sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                
                self.deleteItem(item: item)
                
            }))
            sheet.addAction(UIAlertAction(title: "See Details", style: .default, handler: { _ in
                
               
                switch indexPath.row{
                case 0 : //Besi
                    vc.productNames = "Besi"
                    vc.productDetails = "Besi usually is used as a vital structure of a building. Without it, a building can easily collapse. Available in various diameters: 12 mm, 13 mm, and 22 mm."
                    vc.productPrices = "Rp45,000"
                    vc.productStocks = 1000
                    vc.productPhotos = UIImage(named: "besi")
                    
                    
                    self.present(vc, animated: true, completion: nil)
                    
                case 1 : // Baja
                    vc.productNames = "Baja"
                    vc.productDetails = "Baja mostly is used to built bridges, factories, and other huge buildings. The only available size is 100 x 100 x 6 x 8 mm x 6 m with the weight of 103 kg."
                    vc.productPrices = "Rp1,500,000"
                    vc.productStocks = 1500
                    vc.productPhotos = UIImage(named: "baja")
                    
                    
                    self.present(vc, animated: true, completion: nil)
                    
                case 2 : //Bata
                    
                    vc.productNames = "Bata"
                    vc.productDetails = "Bata is a material that can be used for various building purposes, whether it is to make a foundation or a wall. Size: 110 mm x 220 mm x 55 mm. You can choose two types of bricks, processed conventionally or by oven."
                    vc.productPrices = "Rp850"
                    vc.productStocks = 10000
                    vc.productPhotos = UIImage(named: "bata")
                    
                    
                    
                    
                    self.present(vc, animated: true, completion: nil)
                    
                default:
                    vc.productNames = "gamasuk"
                    
                }
                
            }))
            present(sheet, animated: true, completion: nil)
        }
        
        else{
            
            switch indexPath.row{
            case 0 : //Besi
                vc.productNames = "Besi"
                vc.productDetails = "Besi usually is used as a vital structure of a building. Without it, a building can easily collapse. Available in various diameters: 12 mm, 13 mm, and 22 mm."
                vc.productPrices = "Rp45,000"
                vc.productStocks = 1000
                vc.productPhotos = UIImage(named: "besi")
                
                
                self.present(vc, animated: true, completion: nil)
                
            case 1 : // Baja
                vc.productNames = "Baja"
                vc.productDetails = "Baja mostly is used to built bridges, factories, and other huge buildings. The only available size is 100 x 100 x 6 x 8 mm x 6 m with the weight of 103 kg."
                vc.productPrices = "Rp1,500,000"
                vc.productStocks = 1500
                vc.productPhotos = UIImage(named: "baja")
                
                
                self.present(vc, animated: true, completion: nil)
                
            case 2 : //Bata
                
                vc.productNames = "Bata"
                vc.productDetails = "Bata is a material that can be used for various building purposes, whether it is to make a foundation or a wall. Size: 110 mm x 220 mm x 55 mm. You can choose two types of bricks, processed conventionally or by oven."
                vc.productPrices = "Rp850"
                vc.productStocks = 10000
                vc.productPhotos = UIImage(named: "bata")
                
                
                
                
                self.present(vc, animated: true, completion: nil)
                
            default:
                vc.productNames = "gamasuk"
                self.present(vc, animated: true, completion: nil)
                
            }
        }
    }
    
    
    // Core Data
    
    func getAllItem(){
        
        do {
            models = try context.fetch(SellerProduct.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("error")
        }
        
    }
    
    func getName(){
        
        if seller == true{
            for data in models {
                sellerName =  data.sellerName ?? ""
            }
        }
        else{
            for data in models{
                customerName =  data.customerName ?? ""
            }
            
        }
    }
    
    func createItem(name: String){
        
        let newItem = SellerProduct(context: context)
        newItem.product = name
        newItem.productDate = Date()
        
        do{
            try context.save()
            getAllItem()
        }
        catch{
            print("error save database")
        }
        
    }
    
    func deleteAllData(entity: String){

    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    fetchRequest.returnsObjectsAsFaults = false

    do {
        let arrUsrObj = try managedContext.fetch(fetchRequest)
        for usrObj in arrUsrObj as! [NSManagedObject] {
            managedContext.delete(usrObj)
        }
       try managedContext.save() //don't forget
        } catch let error as NSError {
        print("delete fail--",error)
      }

    }
    
    func deleteItem(item: SellerProduct){
        
        context.delete(item)
        
        do{
            try context.save()
            getAllItem()
        }
        
        catch{
            print("error deleting")
        }
        
    }
    
    
    
}

