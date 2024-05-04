//
//  User.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 07.03.2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let login: String
    let email: String 
}

extension User {
    static var MOCK_USER = User(id: 888, login: "sturdytea", email: "sturdytea@gmail.com")
}
