//
//  LeftMenuViewController.swift
//  SSASideMenuExample
//
//  Created by Sebastian Andersen on 20/10/14.
//  Copyright (c) 2015 Sebastian Andersen. All rights reserved.
//

import Foundation
import UIKit

class LeftMenuViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.frame = CGRect(x: 20, y: (self.view.frame.size.height - 90 * 5) / 2.0, width: self.view.frame.size.width, height: 90 * 5)
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.clear
        view.addSubview(tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


// MARK : TableViewDataSource & Delegate Methods

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
   
        let titles: [String] = ["Home", "Products", "Our Trust", "My Account", "Contact Us"]
        
        let images: [String] = ["home.png", "products.png", "trust.png", "profile.png", "contact.png"]
        
        cell.backgroundColor = UIColor.init(red: 0.3, green: 0.7, blue: 0.8, alpha: 0.7)
        
        
        cell.textLabel?.font = UIFont(name: "Avenir-Book", size: 23)
        cell.textLabel?.text  = titles[indexPath.row]
        cell.selectionStyle = .blue
        cell.textLabel?.textColor=UIColor.black
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
     
        switch indexPath.row {
        case 0:
            
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: FirstViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 1:
            
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: SecondViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        default:
            break
        }
        
        
    }
    
}
    
