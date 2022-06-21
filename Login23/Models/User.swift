//
//  User.swift
//  Login23
//
//  Created by Olga Yurchuk on 17.06.2022.
//

struct User {
    let user: String
    let pass: String
    let person: Person
    
    static func getUsers() -> [User] {
        [
            User(
                user: "User",
                pass: "Pass",
                person: Person(
                    name: "Оля",
                    age: 32,
                    sex: .female,
                    children: ["Алёша", "Лёня"],
                    hobbies: ["Вязание", "Сериалы", "Instagram", "Психология"]
                )
            ),
            User(
                user: "User1",
                pass: "Pass1",
                person: Person(
                    name: "Саша",
                    age: 32,
                    sex: .male,
                    children: ["Лёха", "Ленни"],
                    hobbies: ["Сериалы", "Counter Strike", "Качалка"]
                )
            )
        ]
    }
    
    static func getEmptyUser() -> User {
        User(
            user: "",
            pass: "",
            person: Person(
                name: "",
                age: 0,
                sex: .male,
                children: [],
                hobbies: []
            )
        )
    }
}

struct Person {
    let name: String
    let age: Int
    let sex: Sex
    let children: [String]
    let hobbies: [String]
}

enum Sex {
    case male
    case female
}
