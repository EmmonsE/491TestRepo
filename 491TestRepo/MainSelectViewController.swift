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
    
    @IBOutlet var animationWrapperViews: [UIView]!
    
    @IBOutlet var completedTaskViews: [UIImageView]!
    
    var hasCompletedTest = false
    var hasCompletedTestNameLabel = ""
    var hasCompletedTestList: [String] = []
    
    func checkOffCompletedTests(){
        print(hasCompletedTestNameLabel)
        
        allButtons.forEach { button in
            if (hasCompletedTestList.last == button.titleLabel!.text){
                let indexOfCompletedTest = allButtons.index{$0 === button}
                let imageView = completedTaskViews.filter { $0.tag == indexOfCompletedTest }.first
                let animationWrapperView = animationWrapperViews.filter { $0.tag == indexOfCompletedTest }.first
                animationWrapperView?.backgroundColor = UIColor.darkGray
                imageView?.isHidden = false
                imageView?.slideInFromRight()
                button.isEnabled = false
                button.backgroundColor = UIColor.darkGray
            //hasCompletedTestList.append(hasCompletedTestNameLabel)
                //hasCompletedTestNameLabel = ""
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        if !(self.isMovingToParentViewController || self.isBeingPresented){
            hasCompletedTestList.append(hasCompletedTestNameLabel)
            checkOffCompletedTests()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allButtons.forEach { button in
            
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
        }
        
        completedTaskViews.forEach { view in
            view.layer.cornerRadius = 10
            view.layer.borderWidth = 3
            view.layer.backgroundColor = UIColor(white: 1, alpha: 0.5).cgColor
            view.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
            view.isHidden = true
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
        
        if segue.destination is TremorSelectionViewController {
            
            let nextVC = segue.destination as? TremorSelectionViewController
            nextVC!.hasCompletedTestNameLabelTremor = hasCompletedTestNameLabel
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
