//
//  TremorSelectionViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/2/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class TremorSelectionViewController: UIViewController {
    
    @IBOutlet var allButtons: [UIButton]!
    
    @IBOutlet var animationWrapperViews: [UIView]!
    
    @IBOutlet var completedTaskViews: [UIImageView]!
    
    var someButtons: [UIButton] = []
    var buttonNameList: [String] = []
    var hasCompletedTestList: [String] = []
    var hasCompletedTestNameLabelTremor = ""
    
//    func checkOffCompletedTests(){
//        print(hasCompletedTestNameLabelTremor)
//        someButtons.forEach { button in
//            let indexOfCompletedTest = someButtons.index{$0 === button}
//            let imageView = completedTaskViews.filter { $0.tag == indexOfCompletedTest }.first
//            let animationWrapperView = animationWrapperViews.filter { $0.tag == indexOfCompletedTest }.first
//            animationWrapperView?.backgroundColor = UIColor.darkGray
//            imageView?.isHidden = false
//            imageView?.slideInFromRight()
//            button.isEnabled = false
//            button.backgroundColor = UIColor.darkGray
//            hasCompletedTestNameLabelTremor = ""
////            if (someButtons.last){
////                imageView?.slideInFromRight()
////            }
//        }
//    }
    
//    override func viewDidAppear(_ animated: Bool){
//        super.viewDidAppear(animated)
//        
//        hasCompletedTestList.forEach { test in
//            checkOffCompletedTests()
//        }
//    }
    
//    func styleUncheckedButtons(){
//        allButtons.forEach { button in
//            button.layer.cornerRadius = 10
//            button.layer.borderWidth = 1
//            button.layer.borderColor = UIColor.darkGray.cgColor
//        }
//
//        completedTaskViews.forEach { view in
//            view.layer.cornerRadius = 10
//            view.layer.borderWidth = 3
//            view.layer.backgroundColor = UIColor(white: 1, alpha: 0.5).cgColor
//            view.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
//            view.isHidden = true
//        }
//
//        animationWrapperViews.forEach { wrapper in
//            wrapper.layer.cornerRadius = 10
//        }
//    }
    
    func checkOffCompletedTests(){
        print(hasCompletedTestNameLabelTremor)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !(self.isMovingToParentViewController || self.isBeingPresented){
            hasCompletedTestList.append(hasCompletedTestNameLabelTremor)
            checkOffCompletedTests()
        }
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        checkOffCompletedTests()
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
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
            nextVC?.buttonMenuLabel = button.titleLabel!.text ?? ""
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
