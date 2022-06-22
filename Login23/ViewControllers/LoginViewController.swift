//
//  ViewController.swift
//  Login23
//
//  Created by Olga Yurchuk on 09.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let users = User.getUsers()
    var currentUser = User.getEmptyUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        for viewController in tabBarController.viewControllers! {
            if let greetingVC = viewController as? GreetingViewController {
                greetingVC.currentUser = currentUser
            }
            
            if let hobbiesVC = viewController as? HobbiesViewController {
                hobbiesVC.currentUser = currentUser
            }
            
            if let childrenVC = viewController as? ChildrenViewController {
                childrenVC.currentUser = currentUser
            }
        }
    }

    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func loginPassVerification() {
        for user in users {
            if user.user == userNameTF.text && user.pass == passwordTF.text {
                currentUser = user
            }
        }
        if currentUser.user == "" {
            showAlert(with: "Wrong User Name or Password",
                      and: "Please enter correct User Name and Password")
            passwordTF.text = "" }
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
        currentUser = User.getEmptyUser()
    }
    
    // Работа с клавиатурой
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == userNameTF {
                passwordTF.becomeFirstResponder()
                } else {
                loginPassVerification()
                view.endEditing(true)
                performSegue(withIdentifier: "showGVC", sender: nil)
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
