//
//  FirstViewController.swift
//  SSASideMenuExample
//
//  Created by Sebastian Andersen on 20/10/14.
//  Copyright (c) 2015 Sebastian Andersen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,UIWebViewDelegate{
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 10 //whatever height you want
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
    }
         override func viewDidLoad() {
        super.viewDidLoad()
            
                  let button = UIButton.init(type: .custom)
       
        //set image for button
                
        button.setImage(UIImage(named: "cart.png"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(SSASideMenu.presentRightMenuViewController), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let barButton = UIBarButtonItem(customView: button)
       
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.1, green: 0.6, blue: 1.0, alpha: 1.0)
            navigationController?.navigationBar.barStyle = .blackTranslucent
        view.backgroundColor = UIColor.white
        title = "Home"
            
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
       
        navigationItem.rightBarButtonItem = barButton
        
        let myWebView:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        
        self.view.addSubview(myWebView)
        
        myWebView.delegate = self
        myWebView.backgroundColor=UIColor.black
        myWebView.tintColor=UIColor.blue
       myWebView.scrollView.setZoomScale(1, animated: true)
        let myURL = Bundle.main.url(forResource: "index", withExtension:"html")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
       myWebView.scalesPageToFit=true;
        myWebView.loadRequest(myURLRequest)
    }
  
    @IBOutlet var se: UIBarButtonItem!
       func webViewDidStartLoad(_ webView: UIWebView)
    {
        SwiftSpinner.setTitleFont(UIFont(name: "Avenir-Book", size: 21.0))
        SwiftSpinner.show("Loading the Arena....")
        
          }
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        SwiftSpinner.hide()
           }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}

