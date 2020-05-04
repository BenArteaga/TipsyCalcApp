//
//  ViewController.swift
//  TipsyCalcApp
//
//  Created by Ben Arteaga on 4/30/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLbl: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //split check IBOutlets
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var yourAmountLbl: UILabel!
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalcVals()
        updateUI()
    }
    
    func setTipCalcVals() {
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }
    
    func setYourAmount() {
        tip.splitNum = Int(splitSlider.value)
        tip.calculateAmountYouPay()
    }
    
    func updateUI() {
        tipLbl.text = String(format: "$%0.2f", tip.tipAmount)
        totalLbl.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip: \(Int(tipPercentageSlider.value * 100))%"
        splitLabel.text = "\(Int(splitSlider.value))-Way Split"
    }
    
    @IBAction func tipPercDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        
        setTipCalcVals()
        updateUI()
    }
    
    @IBAction func billAmountWasChanged(_ sender: Any) {
        setTipCalcVals()
        updateUI()
    }
    
    @IBAction func splitWasChanged(_ sender: UISlider) {
        setYourAmount()
        updateUI()
    }
}

