//
//  Customer.swift
//  LemonadeStand
//
//  Created by Crystal Wong Kruger on 2015-06-02.
//  Copyright (c) 2015 SmileyTown. All rights reserved.
//

import Foundation


class Customer {
    
    let kAcidic = 1.0
    let kEqual = 0.0
    let kDiluted = -1.0
    
    var lemonadeTastePreference = 0.0
    var lemonadeTastePreferenceValue = 0.0
    
    func getLemonadeTastePreference () -> Double {
        var randomNumber = Double(arc4random_uniform(UInt32(101)))
        lemonadeTastePreferenceValue = randomNumber / 100
        if lemonadeTastePreferenceValue < 0.4 {
            return kAcidic
        } else if lemonadeTastePreferenceValue > 0.4 && lemonadeTastePreferenceValue < 0.6 {
            return kEqual
        } else {
            return kDiluted
        }
    }
}