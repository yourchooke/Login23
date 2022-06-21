//
//  User.swift
//  Login23
//
//  Created by Olga Yurchuk on 17.06.2022.
//

class User {
    let user: String
    let pass: String
    let person: Person

    init(
        user: String,
        pass: String,
        name: String,
        surname: String,
        sex: Sex,
        age: Int
    )
    {
        person = Person.init(name: name, surname: surname, sex: sex, age: age)
        self.user = user
        self.pass = pass
    }
}

class Person {
    let name: String
    let surname: String
    let sex: Sex
    var age = 0
    var partner: [Person]
    var family: [Person]
    var hobbies: [String]
    
    init(name: String, surname: String, sex: Sex, age: Int){
        self.name = name
        self.surname = surname
        self.sex = sex
        self.age = age
        partner = []
        family = []
        hobbies = []
    }
}

enum Sex {
    case male
    case female
}
