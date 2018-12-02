//
//  ViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 11/7/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class StartTestViewController: UIViewController {

    @IBOutlet weak var testNameLabel: UILabel!
    
    @IBOutlet weak var startTestButton: UIButton!
    
    var currTestName = ""
    //get tests from buttons
    let testName = "tremor"
    switch testName {
        case "tremor":
            let text = """
                        Tremor
                        """
            testNameLabel.text = text
        case "bradykinesia":
            let text = """
                        Bradykinesia
                        """
            testNameLabel.text = text
        case "balance":
            let text = """
                        Balance
                        """
            testNameLabel.text = text
        case "cognitive":
            let text = """
                        Cognitive
                        """
            testNameLabel.text = text
        case "rest tremor":
            let text = """
                        Rest Tremor
                        """
            testNameLabel.text = text
        case "postural tremor":
            let text = """
                        Postural Tremor
                        """
            testNameLabel.text = text
        case "intention tremor":
            let text = """
                        Intention Tremor
                        """
            testNameLabel.text = text
        case "kinetic tremor":
            let text = """
                        Kinetic Tremor
                        """
            testNameLabel.text = text
        case "rapid alternating movements":
            let text = """
                        Rapid Alternating Movements
                        """
            testNameLabel.text = text
        case "finger tapping":
            let text = """
                        Finger Tapping
                        """
            testNameLabel.text = text
        default:
            let text = "No test selected"
            statusLabel.text = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

