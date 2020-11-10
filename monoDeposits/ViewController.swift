//
//  ViewController.swift
//  monoDeposits
//
//  Created by Алексей Злотник on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var uahButton: UIButton!{
        didSet{
            uahButton.isSelected = true
        }
    }
    @IBOutlet weak var dollarButton: UIButton!
    @IBOutlet weak var euroButton: UIButton!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var monthStepper: UIStepper!{
        didSet{
            monthStepper.value = 12
        }
    }
    @IBOutlet weak var stepperMonthLabel: UILabel!
    @IBOutlet weak var stepperPercentLabel: UILabel!
    @IBOutlet weak var closeDepositAnyTimeSwitcher: UISwitch!
    @IBOutlet weak var createDepositButton: UIButton!
    
    var monthes: Int = 12
    
    
    // создать енам с длительностю депозита и соответствующими ставками
    // сначала для гривны: чтобы отточить функционал, потом для доллара и евро
    
    let uahMonthes = [
        "1": 8,
        "2": 8,
        "3": 9,
        "4": 9,
        "5": 9,
        "6": 10,
        "7": 10,
        "8": 10,
        "9": 10.5,
        "10": 10.5,
        "11": 10.5,
        "12": 11
    ]
    
    let dollarMonthes = [
        "1": 1,
        "2": 1,
        "3": 1.25,
        "4": 1.25,
        "5": 1.25,
        "6": 1.5,
        "7": 1.5,
        "8": 1.5,
        "9": 1.75,
        "10": 1.75,
        "11": 1.75,
        "12": 2
    ]
    
    let euroMonthes = [
        "1": 0.25,
        "2": 0.25,
        "3": 0.5,
        "4": 0.5,
        "5": 0.5,
        "6": 0.75,
        "7": 0.75,
        "8": 0.75,
        "9": 1,
        "10": 1,
        "11": 1,
        "12": 1.25
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthes = Int(monthStepper.value)
        setup(monthes: monthes)
        
    }
    
    @IBAction func monthStepperValueChanged(_ sender: UIStepper) {
        
        monthes = Int(monthStepper.value)
        setup(monthes: monthes)
        
    }
    
    func setup(monthes: Int){
        
        stepperMonthLabel.text = "\(monthes) месяцев"
        
        // uah button is selected
        if uahButton.isSelected == true {
            
            for (key, value) in uahMonthes {
                if String(monthes) == key{
                    percentLabel.text = "\(value) %"
                    stepperPercentLabel.text = "Процентная ставка \(value) %"
                }
            }
            // dollar button is selected
        } else if dollarButton.isSelected == true {
            for (key, value) in dollarMonthes {
                if String(monthes) == key{
                    percentLabel.text = "\(value) %"
                    stepperPercentLabel.text = "Процентная ставка \(value) %"
                }
            }
            // euro button is selected
        } else {
            for (key, value) in euroMonthes {
                if String(monthes) == key{
                    percentLabel.text = "\(value) %"
                    stepperPercentLabel.text = "Процентная ставка \(value) %"
                }
            }
        }
    }
    
    @IBAction func closeDepositAnyTimeSwitcherValueChanged(_ sender: UISwitch) {
        
        if closeDepositAnyTimeSwitcher.isOn{
            print("c досрочным расторжением")
        }
    }
    
    
    // Logic for one of three buttons to be selected
    
    @IBAction func uahButtonTapped(_ sender: UIButton) {
        if uahButton.isSelected {
            // set deselected
            uahButton.isSelected = false
        } else {
            // set selected
            uahButton.isSelected = true
            dollarButton.isSelected = false
            euroButton.isSelected = false
            setup(monthes: monthes)
        }
    }
    
    @IBAction func dollarButtonTapped(_ sender: UIButton) {
        if dollarButton.isSelected {
            // set deselected
            dollarButton.isSelected = false
        } else {
            // set selected
            dollarButton.isSelected = true
            uahButton.isSelected = false
            euroButton.isSelected = false
            setup(monthes: monthes)
        }
    }
    @IBAction func euroButtonTapped(_ sender: UIButton) {
        if euroButton.isSelected {
            // set deselected
            euroButton.isSelected = false
        } else {
            // set selected
            euroButton.isSelected = true
            uahButton.isSelected = false
            dollarButton.isSelected = false
            setup(monthes: monthes)
        }
    }
    
}

