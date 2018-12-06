//
//  TestCompletedViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/6/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class TestCompletedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide default navigation back button
        self.navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retakeTestTap(_ sender: Any) {
        
        // Pop to last test Start Test view
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    
    @IBAction func takeAnotherTestTap(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        guard let mainNavigationVC = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as? MainNavigationController else {
            return
        }

        if let mainVC = mainNavigationVC.topViewController as? MainSelectViewController{
                    mainVC.hasCompletedTest = true
                }
        
        
        // Pop to Main Test Selection Menu
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
    self.navigationController!.popToViewController(viewControllers[1], animated: true)
    }
}
