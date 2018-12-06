//
//  MainSelectViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/2/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class MainSelectViewController: UIViewController {
    
    @IBAction func unwindToMainSelectViewController(segue: UIStoryboardSegue) {
        print("Unwind to Main Menu View Controller")
    }
    
    @IBOutlet var allButtons: [UIButton]!
    
    @IBOutlet weak var testUIImageView: UIImageView!
    
    
    @IBOutlet var animationWrapperViews: [UIView]!
    
    @IBOutlet var completedTaskViews: [UIImageView]!
    
    var hasCompletedTest = false
    var hasCompletedTestNameLabel = ""
    
    func checkOffCompletedTests(){
        print(hasCompletedTestNameLabel)
        switch hasCompletedTestNameLabel {
        case "Balance":
            testUIImageView.isHidden = false
            self.testUIImageView.slideInFromRight()
        default:
            return
        }
        
//        if hasCompletedTest == true {
//        testUIImageView.isHidden = false
//        self.testUIImageView.slideInFromRight()
//        } else {
//            return
//        }
    }
    
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        if (self.isMovingToParentViewController || self.isBeingPresented){
        } else {
            checkOffCompletedTests()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allButtons.forEach { button in
            
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
            testUIImageView.isHidden = true
        }
        
        completedTaskViews.forEach { view in
            view.layer.cornerRadius = 10
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.green.cgColor
        }
        
        animationWrapperViews.forEach { wrapper in
            wrapper.layer.cornerRadius = 10
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let button = sender as! UIButton
        
        if segue.destination is TestPageViewController {
            
        let nextVC = segue.destination as? TestPageViewController
        nextVC!.buttonMenuLabel = button.titleLabel!.text ?? ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
