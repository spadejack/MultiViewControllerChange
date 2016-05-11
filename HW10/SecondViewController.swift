//
//  SecondViewController.swift
//  HW10
//
//  Created by Spade Jack on 5/10/16.
//  Copyright © 2016 galileo.jack. All rights reserved.
//

import UIKit

enum GFType {
    case FirstType,SecondType,ThirdType
}

class SecondViewController: UIViewController,EditInfoDelegate {

    var GFName:String? = nil
    var GFConstellation:String? = nil
    var GFImage:String? = nil
    var grilfriendType:GFType? = nil
    var gfDic = Dictionary<String, String>()
    
    @IBOutlet weak var gfImageView: UIImageView!
    @IBOutlet weak var gfNameLabel: UILabel!
    @IBOutlet weak var gfCostellationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupInitView(grilfriendType!)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "不可褻玩"
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - EditInfoDelegate
    func didEditInfo(name: String, constellation: String) {
        
        self.gfNameLabel.text = name
        self.gfCostellationLabel.text = constellation
    }
    
    //MARK: - Private Methods
    
    func setupInitView(type:GFType) -> Void {
        var dic = self.setupType(grilfriendType!)
        let imgName = dic["image"]
        
        self.gfNameLabel.text = dic["name"]
        self.gfCostellationLabel.text = dic["constellation"]
        self.gfImageView.image = UIImage(named:imgName!)
        
    }
    
    func setupType(type:GFType) -> Dictionary<String, String> {
    
        grilfriendType! = type
        gfDic.removeAll()

        switch grilfriendType! {
        case .FirstType:
            GFName = "新垣結依"
            GFConstellation = "雙子座"
            GFImage = "one.jpg"
            gfDic = ["name":GFName!, "constellation":GFConstellation!, "image":GFImage!]
            print("\(1)")
        case .SecondType:
            GFName = "莎莉賽隆"
            GFConstellation = "獅子座"
            GFImage = "two.jpg"
            gfDic = ["name":GFName!, "constellation":GFConstellation!, "image":GFImage!]
            print("\(2)")
        case .ThirdType:
            GFName = "莎朗史東"
            GFConstellation = "雙魚座"
            GFImage = "three.jpg"
            gfDic = ["name":GFName!, "constellation":GFConstellation!, "image":GFImage!]
            print("\(3)")
        }
        return gfDic
    }
    
    func setupNavigationBar() -> Void {
        
        let editButton = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: #selector(goEditView))
        self.navigationItem.rightBarButtonItem = editButton        
    }
    
    func back (sender:UIBarButtonItem) -> Void {
        
    }
    
    func goEditView() -> Void {
        let thirdViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
        thirdViewController.delegate = self
        thirdViewController.oldName = gfDic["name"]
        thirdViewController.oldConstellation = gfDic["constellation"]
        thirdViewController.imgName = gfDic["image"]
        
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
}
