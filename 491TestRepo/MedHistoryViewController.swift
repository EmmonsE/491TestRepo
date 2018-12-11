//
//  ViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 11/7/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

class MedHistoryViewController: UIViewController {
    @IBOutlet var lineFields:[UITextField]!
    @IBAction func saveData(_ sender: Any) {
        saveData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileURL = self.dataFileURL()
        if (FileManager.default.fileExists(atPath: fileURL.path!)) {
            if let array = NSArray(contentsOf: fileURL as URL) as? [String] {
                for i in 0..<array.count {
                    lineFields[i].text = array[i]
                }
            }
        }
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(notification:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
    }
    @objc func applicationWillResignActive(notification:NSNotification) {
        saveData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataFileURL() -> NSURL {
        let urls = FileManager.default.urls(for:
            .documentDirectory, in: .userDomainMask)
        var url:NSURL?
        url = URL(fileURLWithPath: "") as NSURL?      // create a blank path
        url = urls.first?.appendingPathComponent("data.archive") as NSURL?
        return url!
    }
    
    // saves sata when update button is pressed or home button is pressed
    func saveData() {
        // write to plist here
        let date = NSDate()
        let fileURL = self.dataFileURL()
        let array  = (self.lineFields as NSArray).value(forKey: "text") as! NSArray
        array.write(to: fileURL as URL, atomically: true)
        
        //XML portion
        
        NSLog(lineFields[0].text!)
        //build xml doc
        var xmlString = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
        
        xmlString = xmlString + "<medicalHistory>\n"
        
        xmlString = xmlString + "<age>\(lineFields[0].text!)</age>\n"
        
        xmlString = xmlString + "<gender>\(lineFields[7].text!)</gender>\n"
        
        xmlString = xmlString + "<race>\(lineFields[1].text!)</race>\n"
        
        xmlString = xmlString + "<height>\(lineFields[2].text!)</height>\n"
        
        xmlString = xmlString + "<weight>\(lineFields[8].text!)</weight>\n"
        
        xmlString = xmlString + "<status>\(lineFields[3].text!)</status>\n"
        
        xmlString = xmlString + "<education>\(lineFields[4].text!)</education>\n"
        
        xmlString = xmlString + "<generalHealth>\(lineFields[5].text!)</generalHealth>\n"
        
        xmlString = xmlString + "<diagnosedDiseases>\(lineFields[6].text!)</diagnosedDiseases>\n"
        
        xmlString = xmlString + "</medicalHistory>\n"
        
        
        //write to file
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("medical_history \(date).xml")
        
        do {
            try xmlString.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            NSLog(xmlString)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
    }


}

