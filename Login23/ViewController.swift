//
//  ViewController.swift
//  Login23
//
//  Created by Olga Yurchuk on 09.06.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "Oops!", and: "Your name is User 😜")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Oops!", and: "Your password is Pass 🤫")
    }
    


}


// MARK: - Private Methods
extension ViewController {
    private func showAlert(with title: String, and message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
