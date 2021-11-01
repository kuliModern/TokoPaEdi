//
//  UserCartViewController.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 25/10/21.
//

import UIKit

class UserCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [SellerProduct]()
    var cartProduct:[String] = []
    
    
    // Table View
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        getCartItem()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.circle"), style: .plain, target: self, action: #selector(checkOutButtonPressed))
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = cartProduct[indexPath.row]
        return cell
        
    }
    
    @objc func checkOutButtonPressed() {
        
       
        
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
    
    func getCartItem(){
        
        getAllItem()
        for dataCart in models{
            cartProduct.append(dataCart.productToCart ?? "")
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
    }
}
