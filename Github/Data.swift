//
//  Data.swift
//  Github
//
//  Created by Panupong Chaiyarut on 18/10/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import Foundation

struct getdata: Codable {
    let login: String
 
}

struct getrepo: Codable {
    let name: String
    let stargazers_count: Int
}

struct getcontribute: Codable {
    let login: String
    let avatar_url: String
}
