/*
Name: Ajay Hosmar Shenoy
CWID: 805588878
Class: Spring 2017 CPSC 411-01
Description: This swift file is for all the view-controller interaction for BMI Calculator. Based on Metric switch it chooses the units that will be used for the BMI calculation 
and outputs the result with approx visual physic of the person and provide me him tips for normal bmi if he doesnt't fall under normal category.
*/
// Source:http://stackoverflow.com/questions/39546856/how-to-open-an-url-in-swift3
//  ViewController.swift
//  bmi
//
//  Created by Ajay Shenoy on 2/13/17.
//  Copyright © 2017 Ajay Shenoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
//MARK: Properties
    
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var hTextField: UITextField!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var wTextField: UITextField!
    @IBOutlet weak var metricSwitch: UISwitch!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var linkLabel: UILabel!
    var strUrl:String = "http://www.alamy.com/stock-photo-fat-to-thin-process-and-thin-to-muscular-concept-icon-symbol-sign-89509938.html"
    var strNUrl:String=""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func keyboardDismiss() {
        hTextField.resignFirstResponder()
        wTextField.resignFirstResponder()
    }
    
    

    @IBAction func mSwitch(_ sender: UISwitch) {
        if metricSwitch.isOn{
            hTextField.placeholder="in cm"
            wTextField.placeholder="in Kg"
            hLabel.text="Height in Cm"
            wLabel.text="Weight in Kg"
           // wTextField.text=""
        }
        else
        {
            hTextField.placeholder="in inches"
            wTextField.placeholder="in lbs"
            hLabel.text="Height in inches"
            wLabel.text="Weight in lbs"
            //hTextField.text=""
            //wTextField.text=""
        }
    }
    func open(scheme: String) {
        if let url = URL(string: scheme) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                                            print("Open \(scheme): \(success)")
                })
            } else {
                let success = UIApplication.shared.openURL(url)
                print("Open \(scheme): \(success)")
            }
        }
    }
    @IBOutlet weak var sourceButton: UIButton!
    @IBAction func sourceInfo(_ sender: UIButton) {
        open(scheme: strUrl )
    }
    @IBAction func linkButton(_ sender: UIButton) {
        open(scheme: strNUrl )
    }
    @IBOutlet weak var photoLabel: UILabel!
   
    @IBOutlet weak var sks: UIButton!
   
    @IBOutlet weak var tipsLabel: UILabel!
    @IBAction func calBMI(_ sender: UIButton) {
        keyboardDismiss()
        if metricSwitch.isOn
        {
            var htemp:Double=0.0
            var wtemp:Double=0.0
            var bmi:Double=0.0
            var temp1:Double=0.0
            hTextField.placeholder="in cm"
            wTextField.placeholder="in Kg"
            htemp=Double(hTextField.text!)!
            wtemp=Double(wTextField.text!)!
            temp1=htemp/100.0
            bmi=Double(wtemp/(temp1*temp1))
            resultLabel.isHidden=false
            sourceButton.isHidden=false
            tipsLabel.isHidden=false
            sks.isHidden=false
            photoLabel.isHidden=false
            tipsLabel.isHidden=false
            tipsLabel.text="Tips for Normal BMI"
            switch(bmi){
                
            case 0..<16 : resultLabel.text = String(format: "%.2f",bmi)+" Severe Thinness"
            strNUrl="http://www.wikihow.com/Gain-Weight-Quickly"
                imageView.image = UIImage(named: "severethin")
            case 16.00..<16.99: resultLabel.text = String(format: "%.2f",bmi)+" Moderate Thinness"
            strNUrl="http://www.wikihow.com/Gain-Weight-Quickly"
                imageView.image = UIImage(named: "moderatethin")
            case 17.00..<18.49: resultLabel.text = String(format: "%.2f",bmi)+" Mild Thinness"
            strNUrl="http://www.wikihow.com/Gain-Weight-Quickly"
                imageView.image = UIImage(named: "mildthin")
            case 18.5..<24.99: resultLabel.text = String(format: "%.2f",bmi)+" Normal Range"
            tipsLabel.text="Maintain your normal BMI"
            sks.isHidden=true
                imageView.image = UIImage(named: "normal")
            case 25.00..<29.99: resultLabel.text = String(format: "%.2f",bmi)+" Overweight"
                imageView.image = UIImage(named: "overweight")
                strNUrl="https://authoritynutrition.com/6-proven-ways-to-lose-belly-fat/"
            case 30.00..<34.99: resultLabel.text = String(format: "%.2f",bmi)+" Obese Class I(Moderate)"
                imageView.image = UIImage(named: "obeseclass1")
                strNUrl="https://authoritynutrition.com/6-proven-ways-to-lose-belly-fat/"
            case 35.00..<39.99: resultLabel.text = String(format: "%.2f",bmi)+" Obese Class II(Severe)"
            strNUrl="https://authoritynutrition.com/6-proven-ways-to-lose-belly-fat/"
                imageView.image = UIImage(named: "obeseclass2")
            default : resultLabel.text = String(format: "%.2f",bmi)+" Obese Class III(Very Severe"
            strNUrl="https://authoritynutrition.com/6-proven-ways-to-lose-belly-fat/"
                imageView.image = UIImage(named: "obeseclass3")
                
            }
            
        
    }
        else
        {
            var htemp:Double=0.0
            var wtemp:Double=0.0
            var bmi:Double=0.0
            var temp1:Double=0.0
            var temp2:Double=0.0
            hTextField.placeholder="in inches"
            wTextField.placeholder="in lbs"
            htemp=Double(hTextField.text!)!
            wtemp=Double(wTextField.text!)!
            temp1=htemp*0.0254
            temp2=wtemp/2.20462
            bmi=Double(temp2/(temp1*temp1))
             resultLabel.isHidden=false
            sourceButton.isHidden=false
            tipsLabel.isHidden=false
            sks.isHidden=false
            photoLabel.isHidden=false
            tipsLabel.isHidden=false
            tipsLabel.text="Tips for Normal BMI"
            switch(bmi){
                
            case 0..<16 : resultLabel.text = String(format: "%.2f",bmi)+" Severe Thinness"
                strNUrl="http://www.wikihow.com/Gain-Weight-Quickly"
            case 16.00..<16.99: resultLabel.text = String(format: "%.2f",bmi)+" Moderate Thinness"
                strNUrl="http://www.wikihow.com/Gain-Weight-Quickly"
            case 17.00..<18.49: resultLabel.text = String(format: "%.2f",bmi)+" Mild Thinness"
                strNUrl="http://www.wikihow.com/Gain-Weight-Quickly"
            case 18.5..<24.99: resultLabel.text = String(format: "%.2f",bmi)+" Normal Range"
            tipsLabel.text="Maintain your normal BMI"
            sks.isHidden=true
            case 25.00..<29.99: resultLabel.text = String(format: "%.2f",bmi)+" Overweight"
            case 30.00..<34.99: resultLabel.text = String(format: "%.2f",bmi)+" Obese Class I(Moderate)"
                strNUrl="https://authoritynutrition.com/6-proven-ways-to-lose-belly-fat/"
            case 35.00..<39.99: resultLabel.text = String(format: "%.2f",bmi)+" Obese Class II(Severe)"
                strNUrl="https://authoritynutrition.com/6-proven-ways-to-lose-belly-fat/"
            default : resultLabel.text = String(format: "%.2f",bmi)+" Obese Class III(Very Severe"
                strNUrl="https://authoritynutrition.com/6-proven-ways-to-lose-belly-fat/"
                
            }

            
        }
        

}
}

