//
//  MainSelectionViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/2/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class MainSelectionViewController: UIViewController {
    
    
    @IBOutlet weak var balanceButtonTitle: UIButton!
    
    //var txtData = "Balance Test"
    
    @IBAction func balanceTestTap(_ sender: Any) {
        
        if let VC:TestPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "TestPageViewController") as? TestPageViewController {
            
            VC.txtData = balanceButtonTitle.titleLabel!.text ?? ""
                self.navigationController?.pushViewController(VC, animated: true)
        }

        
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//        guard let testPageVC = mainStoryboard.instantiateViewController(withIdentifier: "MainSelectionViewController") as? MainSelectionViewController else {
//            return
//        }
//
//        if let testVC = testPageVC.topView as? MainSelectionViewController{
//            testVC.testLabel = testNameLabel.text
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
