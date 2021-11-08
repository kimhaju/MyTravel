//
//  UserModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/05.
//

import Foundation

//->인코더 기능 준수

struct User: Encodable, Decodable {
    var uid: String
    var email : String
    var country: String
    var profileImageURL: String
    var username: String
    var searchName: [String]
    var bio: String
}
