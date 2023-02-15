//
//  ViewController.swift
//  Login And Password
//
//  Created by Илья Стратович on 13.02.23.
//

import UIKit
// MARK: MainViewController

final class MainViewController: UIViewController {
    
   // MARK: IBOutlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    private let userName = "User"
    private let userPassword = "1"
   
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    // MARK: Prepare for segue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.welcome = userNameTF.text
    }
    
    // MARK: IBActions
    
    @IBAction func logInButtonDidTap() {
        if userNameTF.text != userName || passwordTF.text != userPassword {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
            passwordTF.text?.removeAll()
        }
    }
    
    @IBAction func forgotUserNameButtonDidTap() {
        showAlert(
            withTitle: "Oops",
            andMessage: "Your user name is \(userName)😉"
        )
    }
    
    @IBAction func forgotPasswordButtonDidTap() {
        showAlert(
            withTitle: "Oops",
            andMessage: "Your password is \(userPassword)😉"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }
    
}

//MARK: - UIAlertController

extension MainViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

