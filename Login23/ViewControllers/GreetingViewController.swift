//
//  GreetingViewController.swift
//  Login23
//
//  Created by Olga Yurchuk on 10.06.2022.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Hello, " + currentUser.person.name + "!"
        
        if currentUser.person.age >= 30 {
            if currentUser.person.sex == .male {
                emojiLabel.text = "🧔🏻‍♂️"
            } else {
                emojiLabel.text = "👩🏻"
            }
        } else {
            if currentUser.person.sex == .male {
                emojiLabel.text = "👱🏻‍♂️"
            } else {
                emojiLabel.text = "👩🏻‍🦱"
            }
        }
            
            
           
        

    }

}
