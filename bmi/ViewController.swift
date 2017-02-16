//
//  ViewController.swift
//  bmi
//
//  Created by Ajay Shenoy on 2/13/17.
//  Copyright © 2017 Ajay Shenoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//MARK: Properties
    
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var hTextField: UITextField!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var wTextField: UITextField!
    @IBOutlet weak var metricSwitch: UISwitch!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mSwitch(_ sender: UISwitch) {
        if metricSwitch.isOn{
            hTextField.placeholder="in cm"
            wTextField.placeholder="in Kg"
            hTextField.text=""
            wTextField.text=""
        }
        else
        {
            hTextField.placeholder="in inches"
            wTextField.placeholder="in lbs"
            hTextField.text=""
            wTextField.text=""
        }
    }
    @IBAction func calBMI(_ sender: UIButton) {
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
            switch(bmi){
                
            case 0..<16 : resultLabel.text = String(format: "%.2f",bmi)+" Severe Thinness"
                imageView.image = UIImage(named: "severethin")
            case 16.00..<16.99: resultLabel.text = String(format: "%.2f",bmi)+" Moderate Thinness"
                imageView.image = UIImage(named: "moderatethin")
            case 17.00..<18.49: resultLabel.text = String(format: "%.2f",bmi)+" Mild Thinness"
                imageView.image = UIImage(named: "mildthin")
            case 18.5..<24.99: resultLabel.text = String(format: "%.2f",bmi)+" Normal Range"
                imageView.image = UIImage(named: "normal")
            case 25.00..<29.99: resultLabel.text = String(format: "%.2f",bmi)+" Overweight"
                imageView.image = UIImage(named: "overweight")
            case 30.00..<34.99: resultLabel.text = String(format: "%.2f",bmi)+" Obese Class I(Moderate)"
                imageView.image = UIImage(named: "obeseclass1")
            case 35.00..<39.99: resultLabel.text = String(format: "%.2f",bmi)+" Obese Class II(Severe)"
                imageView.image = UIImage(named: "obeseclass2")
            default : resultLabel.text = String(format: "%.2f",bmi)+" Obese Class III(Very Severe"
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
            switch(bmi){
                
            case 0..<16 : resultLabel.text = String(format: "%.2f",bmi)+" Severe Thinness"
            case 16.00..<16.99: resultLabel.text = String(format: "%.2f",bmi)+" Moderate Thinness"
            case 17.00..<18.49: resultLabel.text = String(format: "%.2f",bmi)+" Mild Thinness"
            case 18.5..<24.99: resultLabel.text = String(format: "%.2f",bmi)+" Normal Range"
            case 25.00..<29.99: resultLabel.text = String(format: "%.2f",bmi)+" Overweight"
            case 30.00..<34.99: resultLabel.text = String(format: "%.2f",bmi)+" Obese Class I(Moderate)"
            case 35.00..<39.99: resultLabel.text = String(format: "%.2f",bmi)+" Obese Class II(Severe)"
            default : resultLabel.text = String(format: "%.2f",bmi)+" Obese Class III(Very Severe"
                
            }

            
        }
        

}
}

