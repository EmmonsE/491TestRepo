//
//  RunningTestViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/3/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit
import CoreMotion
import simd

class RunningTestViewController: UIViewController {
    
    @IBOutlet var allButtons: [UIButton]!
    
    @IBOutlet weak var currTestNameLabel: UILabel!
    
    var testNameLabel = ""
    
    var motionManager = CMMotionManager()
    
    var str: String = ""
    
    @IBOutlet var popOver: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load countdown popover on testing View Controller
        //        self.view.addSubview(countdownLabel)
        self.popOver.layer.cornerRadius = 10
        self.view.addSubview(popOver)
        popOver.center = self.view.center
        self.currTestNameLabel.text = testNameLabel
        
        // Start countdown timer
        TIMER = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runCountdownClock), userInfo: nil, repeats: true)
        
        // Button styling
        allButtons.forEach { button in
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
    
    // TODO: Do something when user cancels the test
    @IBAction func cancelButtonTap(_ sender: Any) {
        
    }
    
    
    
    // Pre-test countdown timer
    var TIMER = Timer()
    var SECONDS = 5
    //var countdownLabel: UILabel = UILabel(frame: CGRect(x: 50, y:50, width:320, height:50))
    @IBOutlet weak var countdownLabel: UILabel!
    
    @objc func runCountdownClock() {
        SECONDS = SECONDS - 1
        countdownLabel.text = String(SECONDS)
        // TODO: start data collection here
        // TODO: add "collecting data" animation
        // When timer ends, start data collection and remove countdown subview
        if SECONDS == 0 {
            
            TIMER.invalidate()
            self.popOver.removeFromSuperview()
            startDataCollection()
        }
    }
    
    
    
    
    // Data collection
    var dataCollectionTimer = Timer()
    var secondsForDataCollection = 0
    @IBOutlet weak var dataCollectionTestLabel: UILabel!
    
    @objc func runDataCollectionClock() {
        
        secondsForDataCollection = secondsForDataCollection - 1
        dataCollectionTestLabel.text = String(secondsForDataCollection)
        // TODO: stop data collection and animation
        // TODO: open "finished popup"
        // When data collection timer stops, stop collection data, open "completed view"
        if secondsForDataCollection == 0 {
            stopUpdates()
            dataCollectionTimer.invalidate()
            navigateToTestCompletedInterface()
            
        }
    }
    
    func startDataCollection(){
        
        setDataCollectionTimerTime()
        // Start data collection timer
        
        dataCollectionTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runDataCollectionClock), userInfo: nil, repeats: true)
        startUpdates()
    }
    
    // TODO: finish setting times for all tests
    func setDataCollectionTimerTime(){
        
        switch testNameLabel {
        case "Rest Tremor":
            secondsForDataCollection = 4
        case "Postural Tremor":
            secondsForDataCollection = 3
        case "Intention Tremor":
            secondsForDataCollection = 2
        case "Kinetic Tremor":
            secondsForDataCollection = 1
        default:
            secondsForDataCollection = 1
        }
        return
    }
    
    
    private func navigateToTestCompletedInterface(){
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let completedTestVC = mainStoryboard.instantiateViewController(withIdentifier: "TestCompletedViewController") as? TestCompletedViewController else {
            return
        }
        
        // this is a modal segue; not a push/pop segue
        present(completedTestVC, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startUpdates() {
        NSLog("Updates Started")
        
        let motionManager = self.motionManager
        NSLog("Acceleromter available")
        
        motionManager.showsDeviceMovementDisplay = true
        
        let newLine1 = "Time(sec), Accelerometer X(M/S^2), Accelerometer Y(M/S^2), Accelerometer Z(M/S^2),Gyroscope X(rad/S),Gyroscope Y(rad/S),Gyroscope Z(rad/S)\n"
        self.str.append(contentsOf : newLine1)
        motionManager.startAccelerometerUpdates(to: .main) { accelerometerData, error in
            guard let accelerometerData = accelerometerData else { return }
            
            let date = NSDate().timeIntervalSince1970
            let timestamp = date
            
            let acceleration: double3 = [accelerometerData.acceleration.x, accelerometerData.acceleration.y, accelerometerData.acceleration.z]
            //            NSLog("%0.4f",accelerometerData.acceleration.x)
            let newLine = "\(timestamp),\(accelerometerData.acceleration.x),\(accelerometerData.acceleration.y),\(accelerometerData.acceleration.z),"
            self.str.append(contentsOf : newLine)
            //            self.str = String(format: "%f", accelerometerData.acceleration.x)
            
        }
        
        
        
        
        
        motionManager.showsDeviceMovementDisplay = true
        
        motionManager.startGyroUpdates(to: .main) { gyroData, error in
            guard let gyroData = gyroData else { return }
            
            let rotationRate: double3 = [gyroData.rotationRate.x, gyroData.rotationRate.y, gyroData.rotationRate.z]
            let newLine = "\(gyroData.rotationRate.x),\(gyroData.rotationRate.y),\(gyroData.rotationRate.z)\n"
            self.str.append(contentsOf : newLine)
            
        }
    }
    
    func stopUpdates() {
        NSLog("File Saving")
        let date = NSDate()
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("\(self.testNameLabel)-\(date).csv")
        
        let motionManager = self.motionManager
        
        motionManager.stopAccelerometerUpdates()
        
        do {
            try str.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            NSLog(str)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
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
