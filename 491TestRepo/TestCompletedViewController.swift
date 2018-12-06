//
//  TestCompletedViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/6/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class TestCompletedViewController: UIViewController {
    
    var testNameLabel = ""
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is MainSelectViewController {
            
            let nextVC = segue.destination as? MainSelectViewController
            nextVC!.hasCompletedTest = true
            nextVC!.hasCompletedTestNameLabel = testNameLabel
        }
    }
}
