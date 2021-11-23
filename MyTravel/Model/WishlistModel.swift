//
//  WishListModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/23.
//

import Foundation

struct WishlistModel: Identifiable{
    var id : String
    //->몰라...일단 하드코딩으로 간다...
    var wish_name: String
    var wish_address: String
    var wish_details: String
    var wish_image: String
//    var wish_ratings: String
    var wish_price: String
    //->유저 아이디
    var wish_date: String
    var user_id : String
}
