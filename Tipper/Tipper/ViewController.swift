//
//  ViewController.swift
//  Tipper
//
//  Created by Rajaganesh Ganesh on 8/19/15.
//  Copyright (c) 2015 Rajaganesh Ganesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = .CurrencyStyle
        tipLabel.text = numFormatter.stringFromNumber(0)
        totalLabel.text =  numFormatter.stringFromNumber(0)
        billText.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

