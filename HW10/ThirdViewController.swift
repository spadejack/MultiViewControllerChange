//
//  ThirdViewController.swift
//  HW10
//
//  Created by Spade Jack on 5/10/16.
//  Copyright © 2016 galileo.jack. All rights reserved.
//

import UIKit

protocol EditInfoDelegate:class {
    func didEditInfo(name:String , constellation:String)
}

class ThirdViewController: UIViewController,UITextFieldDelegate {

    var oldName:String? = nil
    var oldConstellation:String? = nil
    var imgName:String? = nil
    var newName:String? = nil
    var newConstellation:String? = nil
    
    weak var delegate:EditInfoDelegate?
    
    @IBOutlet weak var gfImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var constellationTextField: UITextField!
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(resizeView), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(resizeView), name: UIKeyboardWillHideNotification, object: nil)
        self.setupNavigationItem()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "EditInfo"
        self.initView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - TextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField.tag == 100 {
            constellationTextField.becomeFirstResponder()
        }else{
            newName = nameTextField.text!
            newConstellation = constellationTextField.text!
            constellationTextField.resignFirstResponder()
        }
        
        
        return true
    }
    
    //MARK: - KeyBoard Notification
    func resizeView(notification:NSNotification) -> Void {
        
        var info = notification.userInfo!
        
        if notification.name == UIKeyboardWillShowNotification {
        
        }else{
        
        }
    }
    
    //MARK: - Private Methods
    func initView() -> Void {
        
        nameTextField.placeholder = oldName
        constellationTextField.placeholder = oldConstellation
        //gfImageView.image = UIImage(named: imgName!)
    }
    
    func setupNavigationItem() -> Void {
        
        let doneButton = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(doneAction))
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    func doneAction () -> Void {
        
        self.delegate?.didEditInfo(newName!, constellation: newConstellation!)
        NSNotificationCenter.defaultCenter().postNotificationName("MyGirlNameChanged", object: newName!)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
