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
        TIMER = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runClock), userInfo: nil, repeats: true)
        self.view.addSubview(countdownLabel)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var popOver: UIView!
    
    @IBAction func cancelButtonTap(_ sender: Any) {
        self.view.addSubview(popOver)
        popOver.center = self.view.center
    }
    
    var TIMER = Timer()
    var SECONDS = 5
    //var countdownLabel: UILabel = UILabel(frame: CGRect(x: 50, y:50, width:320, height:50))
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    @objc func runClock() {
        SECONDS = SECONDS - 1
        countdownLabel.text = String(SECONDS)
        if SECONDS == 0 {
            //countdownLabel.backgroundColor = UIColor.lightGray
            //countdownLabel.text = "Link to PopOver Now"
            
            TIMER.invalidate()
            self.view.addSubview(popOver)
            popOver.center = self.view.center
        }
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
