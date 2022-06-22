//
//  ChildrenViewController.swift
//  Login23
//
//  Created by Olga Yurchuk on 22.06.2022.
//

import UIKit

class ChildrenViewController: UIViewController {
    
    @IBOutlet weak var listOfChildren: UILabel!
    var currentUser: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        listOfChildren.text = ""
        for child in currentUser.person.children {
            listOfChildren.text! += "🐣" + child + "\n"
        }
    }
    


}
