//
//  MainSelectViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/2/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class MainSelectViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func nextViewTap(_ sender: Any) {
//
//        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TestPageViewController") as? TestPageViewController {
//            nextVC.buttonMenuLabel = testMenuOption.titleLabel!.text ?? ""
//            self.navigationController!.pushViewController(nextVC, animated: true)
//        }
//    }

    
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
