//
//  ViewController.swift
//  Login23
//
//  Created by Olga Yurchuk on 09.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private var loginsDictionary = ["User":"Pass", "User1":"Pass1"]
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? GreetingViewController else { return }
        greetingVC.userName = userNameTF.text
    }

    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super .touchesBegan(touches, with: event)
    }
    
    func loginPassVerification(){
        guard let user = userNameTF.text else {
            return
        }
        guard let pass = passwordTF.text else {
            return
        }
        if loginsDictionary[user] == pass {
            return
        } else {
            showAlert(with: "Wrong User Name or Password", and: "Please enter correct User Name and Password")
            passwordTF.text = ""
        }
    }

    @IBAction func forgotUserButtonPressed() {
        showAlert(with: "Oops!", and: "Your User Name is User 🤫")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Oops!", and: "Your password is Pass 🤫")
    }
    
    @IBAction func logInButtonPressed() {
        loginPassVerification()
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    // Работа с клавиатурой
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == userNameTF { passwordTF.becomeFirstResponder()
            } else {
                loginPassVerification()
                view.endEditing(true)
            }
            return false
        }

}



// MARK: - Private Methods
extension ViewController {
    private func showAlert(with title: String, and message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
