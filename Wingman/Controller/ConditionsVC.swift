//
//  ConditionsVC.swift
//  Wingman
//
//  Created by Rex Nesbit on 12/11/17.
//  Copyright © 2017 Rex Nesbit. All rights reserved.
//

import UIKit


class ConditionsVC: WingmanBaseController {

    //MARK:- Outlets & Variables
    @IBOutlet weak var DatePicker: UIPickerView!
    @IBOutlet weak var moneyPicker: UIPickerView!
    @IBOutlet weak var enviromentPicker: UIPickerView!
    @IBOutlet weak var relationshipPicker: UIPickerView!
    
    //Need to change when actual data comes
    let dates        = [""]
    let money        = [""]
    let enviroment   = [""]
    let relationship = [""]

    var selectedIndex : Int = 0
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.DatePicker.dataSource         = self
        self.DatePicker.delegate           = self
        self.moneyPicker.delegate          = self
        self.moneyPicker.dataSource        = self
        self.enviromentPicker.delegate     = self
        self.enviromentPicker.dataSource   = self
        self.relationshipPicker.dataSource = self
        self.relationshipPicker.delegate   = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    //MARK:- Button Action
    
    //Function will choose a segue path for each differnt date selected.
    @IBAction func startDateType(_ sender: UIButton) {
        
//        if dates[selectedIndex] == "Romantic" {
//            
//            (performSegue(withIdentifier: "StartToRomantic", sender: sender))
//        }
//        else if dates[selectedIndex] == "Active" {
//            
//            (performSegue(withIdentifier: "StartToActive", sender: sender))
//        }
//        else if dates[selectedIndex] == "Relaxed" {
//            
//            (performSegue(withIdentifier: "StartToRelaxed", sender: sender))
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "StartToRomantic"{
//
//            if let romanticVC = segue.destination as? RomanticController{
//            }
//        }
//        else if segue.identifier == "StartToActive"{
//
//            if let ActiveVC = segue.destination as? ActiveController {
//            }
//        }
//        else {
//
//            if let relaxedVC = segue.destination as? RelaxedController {
//                relaxedVC.currentQuestionType = .one
//            }
//        }
    }
    
}

//MARK:- UIPickerView DataSource & Delegate
extension ConditionsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //1 column in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    // the number of rows in picker veiw changes to match all types in the array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == self.DatePicker
        {
            return dates.count
        }
        else if pickerView == self.moneyPicker
        {
            return money.count
        }
        else if pickerView == self.enviromentPicker
        {
            return enviroment.count
        }
        else if pickerView == self.relationshipPicker
        {
            return relationship.count
        }
        
        return 1
    }
    
    //shows names of rows to match array content
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        selectedIndex = row
        if pickerView == self.DatePicker
        {
            return dates[row]
        }
        else if pickerView == self.moneyPicker
        {
            return money[row]
        }
        else if pickerView == self.enviromentPicker
        {
            return enviroment[row]
        }
        else if pickerView == self.relationshipPicker
        {
            return relationship[row]
        }
        
        return ""
    }
    
    //Did select row 
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == self.DatePicker
        {
            selectedIndex = row
            let dateType = dates[row]
            print("Selected Date type: \(dateType)")
        }
        else if pickerView == self.moneyPicker
        {
            let moneyType = money[row]
            print("Selected Money type: \(moneyType)")
        }
        else if pickerView == self.enviromentPicker
        {
            let enviType = enviroment[row]
            print("Selected Enviroment type: \(enviType)")
        }
        else if pickerView == self.relationshipPicker
        {
            let relaType = relationship[row]
            print("Selected Relation type: \(relaType)")
        }
    }
}


