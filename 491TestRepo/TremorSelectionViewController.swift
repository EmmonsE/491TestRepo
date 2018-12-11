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
    
    var hasCompletedTestNameLabelTremor = ""
    
    //let test = CompletedTest()
    
    var modelController: TestModelController!
    
    @IBAction func onSelectTestButtonTap(_ sender: Any) {
        
        let button = sender as! UIButton
        
        let newTest = Test(currTestName: (button.titleLabel!.text ?? ""), hasCompleted: false)
        modelController.test = newTest
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
        //let button = sender as! UIButton

        if segue.destination is TestPageViewController {

            let nextVC = segue.destination as? TestPageViewController
            nextVC?.modelController = modelController
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
