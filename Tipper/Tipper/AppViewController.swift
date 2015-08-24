//
//  AppViewController.swift
//  Tipper
//
//  Created by Rajaganesh Ganesh on 8/19/15.
//  Copyright (c) 2015 Rajaganesh Ganesh. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    //MARK: override fuctions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        var numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = .CurrencyStyle
        tipLabel.text = numFormatter.stringFromNumber(0)
        totalLabel.text =  numFormatter.stringFromNumber(0)
        billText.placeholder = numFormatter.stringFromNumber(0)
        // billText.becomeFirstResponder()
        tipControl.selectedSegmentIndex = 1
        
    }
    
    /*
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }*/

    // MARK: Edit bill amount
    @IBAction func onEditBillAmount(sender: AnyObject) {
        var tipPercentageList = [0.15, 0.18, 0.20]
        var tipPercentage = tipPercentageList[tipControl.selectedSegmentIndex]
        var billAmount = (billText.text as NSString).doubleValue
        var tip = tipPercentage * billAmount
        var total = billAmount + tip
        
        var numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = .CurrencyStyle
        tipLabel.text = numFormatter.stringFromNumber(tip)
        totalLabel.text =  numFormatter.stringFromNumber(total)
       
    }

    // MARK: Hide keyboard
    @IBAction func onTap(sender: AnyObject) {
        billText.resignFirstResponder()
        view.endEditing(true)
    }
    
    // MARK: Elements placement upon keyboard show/hide
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 70
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 70
    }
    
}

