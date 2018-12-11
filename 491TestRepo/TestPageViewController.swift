//
//  TestStartViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/2/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class TestPageViewController: UIViewController {
    
    @IBOutlet var allButtons: [UIButton]!
    
    @IBOutlet weak var testNameLabel: UILabel!
    
    @IBOutlet weak var startTestButton: UIButton!
    
    var buttonMenuLabel = ""
    
    //var test = CompletedTest()
    
    var modelController: TestModelController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelText()
//        private func getLabelText(_ currTestName: String){
//            self.testNameLabel.text = test.currTestName!
//        }
        
        
        
        allButtons.forEach { button in
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
        
    private func setLabelText(){
        
        let test = modelController.test
        testNameLabel.text = test.currTestName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //let button = sender as! UIButton
        
        if segue.destination is RunningTestViewController {
            
            let nextVC = segue.destination as? RunningTestViewController
            nextVC?.testNameLabel = buttonMenuLabel
        }
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
