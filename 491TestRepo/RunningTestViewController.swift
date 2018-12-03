//
//  RunningTestViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/3/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class RunningTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.popOver.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var popOver: UIView!
    
    @IBAction func startButtonTap(_ sender: Any) {
        self.view.addSubview(popOver)
        popOver.center = self.view.center
    }
    
    @IBAction func popOverButtonTap(_ sender: Any) {
        self.popOver.removeFromSuperview()
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
