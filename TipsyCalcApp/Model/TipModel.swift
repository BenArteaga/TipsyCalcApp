//
//  TipModel.swift
//  TipsyCalcApp
//
//  Created by Ben Arteaga on 4/30/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import Foundation

class TipModel {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _splitNum: Int = 0
    private var _amountYouPay: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        }
        set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        }
        set {
            _tipPercent = newValue
        }
    }
    
    var splitNum: Int {
        get {
            return _splitNum
        }
        set {
            _splitNum = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var amountYouPay: Double {
        return _amountYouPay
    }
    
    init(billAmount: Double, tipPercent: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
    }
    
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipPercent
    }
    
    func calculateAmountYouPay() {
        _amountYouPay = totalAmount / Double(splitNum)
    }
}

