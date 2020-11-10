//
//  ViewController.swift
//  monoDeposits
//
//  Created by Алексей Злотник on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var monthStepper: UIStepper!
    @IBOutlet weak var stepperMonthLabel: UILabel!
    @IBOutlet weak var stepperPercentLabel: UILabel!
    @IBOutlet weak var closeDepositAnyTimeSwitcher: UISwitch!
    @IBOutlet weak var createDepositButton: UIButton!
    
    
    // создать енам с длительностю депозита и соответствующими ставками
    // сначала для гривны: чтобы отточить функционал, потом для доллара и евро
    
//    enum uahMonthes: Double, CaseIterable {
//        case one = 1
//        case two
//        case three
//        case four
//        case five
//        case six
//        case seven = 7
//        case eight = 10
//        case nine = 10.5
//        case ten = 10.5
//        case eleven = 10.5
//        case twelve = 11
//    }
//
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
    
//    var uahMonthes = Array(1...12)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func monthStepperValueChanged(_ sender: UIStepper) {
        // добавить или отнять месяц
        // пробежаться по енаму
        // менять значение percentLabel, stepperMonthLabel и stepperPercentLabel
        let monthes = Int(monthStepper.value)

        stepperMonthLabel.text = "\(monthes) месяцев"
        
        for (key, value) in uahMonthes {
            if String(monthes) == key{
                percentLabel.text = "\(value) %"
                stepperPercentLabel.text = "Процентная ставка \(value) %"
            }
        }
    }
    
    @IBAction func closeDepositAnyTimeSwitcherValueChanged(_ sender: UISwitch) {
        // прописать методы для isOn true/false
    }
    

}

