//
//  FirstViewController.swift
//  HW10
//
//  Created by Spade Jack on 5/10/16.
//  Copyright © 2016 galileo.jack. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didNameChanged), name: "MyGirlNameChanged", object: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "只可遠望"
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Notificaiton
    func didNameChanged(notification:NSNotification) -> Void {
        
        let newName:String = notification.object as! String
        
    }
    
    //MARK: - Private Methods
    
    @IBAction func FirstGF(sender: UIButton) {
        
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        secondViewController.grilfriendType = .FirstType
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    @IBAction func secondGF(sender: AnyObject) {
    
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        secondViewController.grilfriendType = .SecondType
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    @IBAction func ThirdGF(sender: UIButton) {
        
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        secondViewController.grilfriendType = .ThirdType
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
