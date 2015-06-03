//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Crystal Wong Kruger on 2015-06-01.
//  Copyright (c) 2015 SmileyTown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    var currentDay = 1
    
    // Vars for Inventory
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var lemonsInInventoryLabel: UILabel!
    @IBOutlet weak var lemonsInventoryLabel: UILabel!
    @IBOutlet weak var iceInInventoryLabel: UILabel!
    @IBOutlet weak var iceInventoryLabel: UILabel!
    var money = 10
    var lemonsInInventory = 1
    var iceInInventory = 1
    
    
    // Vars for Purchasing Supplies
    @IBOutlet weak var buyLemonsLabel: UILabel!
    @IBOutlet weak var buyIceLabel: UILabel!
    var lemonsToBeBought = 0
    var iceToBeBought = 0
    
    // Vars for Mixing Lemonade
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceLabel: UILabel!
    var lemonsToBeMixed = 0
    var iceToBeMixed = 0
    
    var kMaxNumberOfCustomers = 10
    let kAcidic = 1.0
    let kEqual = 0.0
    let kDiluted = -1.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Buttons for Purchasing Supplies
    
    @IBAction func buyLemonButtonPressed(sender: UIButton) {
        if (money >= 2) {
            money -= 2
            moneyLabel.text = "$\(money)"
            lemonsInInventory += 1
            lemonsInInventoryLabel.text = "\(lemonsInInventory)"
            lemonsToBeBought += 1
            buyLemonsLabel.text = "\(lemonsToBeBought)"
        } else {
            println("Not enough money for more lemons")
        }
        if lemonsInInventory > 1 {
            lemonsInventoryLabel.text = "Lemons"
        } else {
            lemonsInventoryLabel.text = "Lemon"
        }
    }
    
    @IBAction func refundLemonButtonPressed(sender: UIButton) {
        if (lemonsToBeBought > 0) {
            money += 2
            moneyLabel.text = "$\(money)"
            lemonsInInventory -= 1
            lemonsInInventoryLabel.text = "\(lemonsInInventory)"
            lemonsToBeBought -= 1
            buyLemonsLabel.text = "\(lemonsToBeBought)"
        } else {
            println("No more ice cubes to refund")
        }
        if lemonsInInventory > 1 {
            lemonsInventoryLabel.text = "Lemons"
        } else {
            lemonsInventoryLabel.text = "Lemon"
        }
        
    }
    
    @IBAction func buyIceButtonPressed(sender: UIButton) {
        if (money >= 1) {
            money -= 1
            moneyLabel.text = "$\(money)"
            iceInInventory += 1
            iceInInventoryLabel.text = "\(iceInInventory)"
            iceToBeBought += 1
            buyIceLabel.text = "\(iceToBeBought)"
        } else {
            println("Not enough money for more ice")
        }
        if iceInInventory > 1 {
            iceInventoryLabel.text = "Ice Cubes"
        } else {
            iceInventoryLabel.text = "Ice Cube"
        }
    }
    
    
    @IBAction func refundIceButtonPressed(sender: UIButton) {
        if (iceToBeBought > 0) {
            money += 1
            moneyLabel.text = "$\(money)"
            iceInInventory -= 1
            iceInInventoryLabel.text = "\(iceInInventory)"
            iceToBeBought -= 1
            buyIceLabel.text = "\(iceToBeBought)"
        } else {
            println("No more ice cubes to refund")
        }
        if iceInInventory > 1 {
            iceInventoryLabel.text = "Ice Cubes"
        } else {
            iceInventoryLabel.text = "Ice Cube"
        }
    }
    
    
    
    // Buttons for Mixing Lemonade
    
    @IBAction func addLemonToMix(sender: UIButton) {
        if (lemonsInInventory > 0) {
            lemonsInInventory -= 1
            lemonsInInventoryLabel.text = "\(lemonsInInventory)"
            lemonsToBeMixed += 1
            mixLemonsLabel.text = "\(lemonsToBeMixed)"
        } else {
            println("No more lemons.  Buy more lemons.")
        }
        if lemonsInInventory > 1 {
            lemonsInventoryLabel.text = "Lemons"
        } else {
            lemonsInventoryLabel.text = "Lemon"
        }
    }
    
    
    @IBAction func subtractLemonFromMix(sender: UIButton) {
        if (lemonsToBeMixed > 0) {
            lemonsToBeMixed -= 1
            mixLemonsLabel.text = "\(lemonsToBeMixed)"
            lemonsInInventory += 1
            lemonsInInventoryLabel.text = "\(lemonsInInventory)"
        } else {
            println("No more lemons to take out.")
        }
        if lemonsInInventory > 1 {
            lemonsInventoryLabel.text = "Lemons"
        } else {
            lemonsInventoryLabel.text = "Lemon"
        }
        
    }
    
    
    @IBAction func addIceToMix(sender: UIButton) {
        if (iceInInventory > 0) {
            iceInInventory -= 1
            iceInInventoryLabel.text = "\(iceInInventory)"
            iceToBeMixed += 1
            mixIceLabel.text = "\(iceToBeMixed)"
        } else {
            println("No more ice.  Buy more ice.")
        }
        if iceInInventory > 1 {
            iceInventoryLabel.text = "Ice Cubes"
        } else {
            iceInventoryLabel.text = "Ice Cube"
        }
    }
    
    
    @IBAction func subtractIceFromMix(sender: UIButton) {
        if (iceToBeMixed > 0) {
            iceToBeMixed -= 1
            mixIceLabel.text = "\(iceToBeMixed)"
            iceInInventory += 1
            iceInInventoryLabel.text = "\(iceInInventory)"
        } else {
            println("No more ice cubes to take out.")
        }
        if iceInInventory > 1 {
            iceInventoryLabel.text = "Ice Cubes"
        } else {
            iceInventoryLabel.text = "Ice Cube"
        }
    }
    
    
    // Start Day Button!!
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        

        startDay()

    }
    
    
    func resetCounters() {
        lemonsToBeBought = 0
        buyLemonsLabel.text = "0"
        iceToBeBought = 0
        buyIceLabel.text = "0"
        lemonsToBeMixed = 0
        mixLemonsLabel.text = "0"
        iceToBeMixed = 0
        mixIceLabel.text = "0"
    }

    
    func startDay() {
        

        var lemonadeTaste:Double
        var customers:[Customer] = []
        var numberOfCustomers = 0
        
        if lemonsToBeMixed == 0 || iceToBeMixed == 0 {
            println("Mix some lemonade!")
        } else {
        
            if lemonsToBeMixed > iceToBeMixed {
                lemonadeTaste = kAcidic
                println("Acidic lemonade for sale today!")
            } else if lemonsToBeMixed == iceToBeMixed {
                lemonadeTaste = kEqual
                println("'Equal' lemonade for sale today!")
            } else {
                lemonadeTaste = kDiluted
                println("Diluted lemonade for sale today!")
            }
        
            // create random number of customers (1-10)
            numberOfCustomers = 1 + Int(arc4random_uniform(UInt32(10)))
        
            // sell to each customer
            for var index = 0; index < numberOfCustomers; index++ {
                var nextCustomer = Customer()
                nextCustomer.lemonadeTastePreference = nextCustomer.getLemonadeTastePreference()
                if nextCustomer.lemonadeTastePreference == lemonadeTaste {
                    println("\(nextCustomer.lemonadeTastePreferenceValue) | Paid!")
                    money += 1
                } else {
                    println("\(nextCustomer.lemonadeTastePreferenceValue) | No match, No Revenue.")
                }
            }
        
            moneyLabel.text = "$\(money)"
            resetCounters()            
            if isGameOver() {
                println("Game Over")
            } else {
                updateDay()
            }
            
        }
    }
    
    func isGameOver() -> Bool {
        if money == 0 && lemonsInInventory == 0 && iceInInventory == 0 {
            return true
        } else {
            return false
        }
    }
    
    func updateDay() {
        currentDay += 1
        titleLabel.text = "Lemonade Stand: Day \(currentDay)"
        
    }
    

}

