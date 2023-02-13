//
//  ViewController.swift
//  Login And Password
//
//  Created by Илья Стратович on 13.02.23.
//

import UIKit

final class ViewController: UIViewController {
    
   // MARK: IBOutlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else
        { return }
        welcomeVC.welcome = userNameTF.text
    }
    

    // MARK: IBActions
    
    @IBAction func logInButtonDidTap() {
        if userNameTF.text != "User" {
            showAlert(
    withTitle: "Invalid login or password",
    andMessage: "Please, enter correct login and password"
)
            passwordTF.text?.removeAll()
        } else if passwordTF.text != "1" {
            showAlert(
    withTitle: "Invalid login or password",
    andMessage: "Please, enter correct login and password"
)
            passwordTF.text?.removeAll()
        }
    }
    
    @IBAction func forgotUserNameButtonDidTap() {
        showAlert(withTitle: "Oops", andMessage: "Your user name is User😉")
    }
    
    @IBAction func forgotPasswordButtonDidTap() {
        showAlert(withTitle: "Oops", andMessage: "Your password is 1😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }
    
}

//MARK: - UIAlertController

extension ViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

