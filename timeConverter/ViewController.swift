//
//  ViewController.swift
//  timeConverter
//
//  Created by Kevin Jasinghe on 2022-02-09.
//

import UIKit

class ViewController: UIViewController {
    
    var conversion = " "
    var convertInto = " "
    
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func secondsButtonOne(_ sender: Any) {
        labelOne.text = "You are converting from seconds"
        conversion = "seconds"
    }
    
    
    @IBAction func minutesButtonOne(_ sender: Any) {
        labelOne.text = "You are converting from minutes"
        conversion = "minutes"
    }
    
    
    @IBAction func hoursButtonOne(_ sender: Any) {
        labelOne.text = "You are converting from hours"
        conversion = "hours"
    }
    
    
    @IBAction func secondsButtonTwo(_ sender: Any) {
        labelTwo.text = "into seconds"
        convertInto = "seconds"
    }
    
    
    @IBAction func minutesButtonTwo(_ sender: Any) {
        labelTwo.text = "into minutes"
        convertInto = "minutes"
    }
    
    
    @IBAction func hoursButtonTwo(_ sender: Any) {
        labelTwo.text = "into hours"
        convertInto = "hours"
    }
    
    @IBAction func tapConvert(_ sender: Any) {
        
        let userInput = textField.text!
        let value = Double(userInput)
        var finalAnswer = 0.0
        
        if conversion == "seconds" && convertInto == "minutes"{
            finalAnswer = secondsToMinutes(value: value!)
        }
        else if conversion == "seconds" && convertInto == "hours" {
            finalAnswer = secondsToHours(value: value!)
        }
        else if conversion == "minutes" && convertInto == "seconds" {
            finalAnswer = minutesToSeconds(value: value!)
        }
        else if conversion == "minutes" && convertInto == "hours" {
            finalAnswer = minutesToHours(value: value!)
        }
        else if conversion == "hours" && convertInto == "seconds" {
            finalAnswer = hoursToSeconds(value: value!)
        }
        else if conversion == "hours" && convertInto == "minutes" {
            finalAnswer = hoursToMinutes(value: value!)
        }
        
        textView.text = "\(value!) \(conversion) is equal to \(finalAnswer) \(convertInto)"
       
    }
    
    private func secondsToMinutes(value: Double) -> Double{
        let answer = value/60
        return answer
    }
    
    private func secondsToHours(value: Double) -> Double{
        let answer = value/3600
        return answer
    }
    
    private func minutesToHours(value: Double) -> Double{
        let answer = value/60
        return answer
    }
    
    private func minutesToSeconds(value: Double) -> Double{
        let answer = value * 60
        return answer
    }
    
    private func hoursToSeconds(value: Double) -> Double{
        let answer = value * 3600
        return answer
    }
    
    private func hoursToMinutes(value: Double) -> Double{
        let answer = value * 60
        return answer
    }
    private func configureTextField(){
            textField.delegate = self
        }
    
}


extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

