//
//  HobbiesViewController.swift
//  Login23
//
//  Created by Olga Yurchuk on 22.06.2022.
//

import UIKit

class HobbiesViewController: UIViewController {

    @IBOutlet weak var listOfHobbies: UILabel!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentUser.user)

        listOfHobbies.text = ""
        for hobby in currentUser.person.hobbies {
            listOfHobbies.text! += "🐞" + hobby + "\n"
        }
    }
    

}
