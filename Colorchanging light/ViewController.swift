//
//  ViewController.swift
//  Colorchanging light
//
//  Created by Sam Burrell on 5/3/18.
//  Copyright © 2018 Sam Burrell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
let lightControl = LightControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func redButton(_ sender: Any) {
        self.lightControl.colorLights(UIColor.red)
    }
    
    @IBAction func greenButton(_ sender: Any) {
        self.lightControl.colorLights(UIColor.green)
    }
    
    @IBAction func blueButton(_ sender: Any) {
        self.lightControl.colorLights(UIColor.blue)
    }
    
    @IBAction func whiteButton(_ sender: Any) {
        self.lightControl.colorLights(UIColor.white)
    }
    
    
}

