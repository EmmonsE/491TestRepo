//
//  TestStartViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/2/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class TestPageViewController: UIViewController {
    
    @IBOutlet weak var testNameLabel: UILabel!
    
    var buttonMenuLabel = ""
    
    
//    @IBAction func startTestTap(_ sender: Any) {
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(buttonMenuLabel)
        self.testNameLabel.text = buttonMenuLabel
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
