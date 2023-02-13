//
//  WelcomeViewController.swift
//  Login And Password
//
//  Created by Илья Стратович on 13.02.23.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var welcome: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcome ?? "")"
    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true)
    }
    

}
