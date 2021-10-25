//
//  UserCartViewController.swift
//  tokoPaEdi
//
//  Created by Azka Kusuma on 25/10/21.
//

import UIKit

class UserCartViewController: UIViewController {
 
 
    
    // Table View
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.frame = view.bounds
        view.addSubview(tableView)

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell
//    }
   
}
