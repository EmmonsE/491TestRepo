//
//  MainSelectViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/2/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class MainSelectViewController: UIViewController {
    
    @IBOutlet var allButtons: [UIButton]!
    
    @IBOutlet weak var testUIImageView: UIImageView!
    
    
    @IBOutlet var animationWrapperViews: [UIView]!
    
    @IBOutlet var completedTaskViews: [UIImageView]!
    
    @IBAction func slideTextButtonTapped(_ sender: UIButton) {
        testUIImageView.isHidden = false
        self.testUIImageView.slideInFromRight()
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
        
        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
