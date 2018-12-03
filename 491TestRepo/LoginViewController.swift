//
//  LoginViewController.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/2/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var allButtons: [UIButton]!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allButtons.forEach { button in
            button.layer.cornerRadius = 10
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        navigateToMainInterface()
    }
    
    private func navigateToMainInterface(){
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let mainNavigationVC = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as? MainNavigationController else {
            return
        }
        
//        if let mainVC = mainNavigationVC.topView as? ViewController{
//            mainVC.userName = userNameTextField.text
//        }
        // this is a modal segue; not a push/pop segue
        present(mainNavigationVC, animated: true, completion: nil)
        
    }
    
}
