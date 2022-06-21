//
//  GreetingViewController.swift
//  Login23
//
//  Created by Olga Yurchuk on 10.06.2022.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Hello, " + userName + "!"
    }
}
