//
//  WishListModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/23.
//

import Foundation
import Firebase

struct WishlistModel: Identifiable{
    var id : String
    //->몰라...일단 하드코딩으로 간다...
    var wish_name: String
    var wish_address: String
    var wish_details: String
    var wish_image: String
//    var wish_ratings: String
    var wish_price: String
    //->날짜를 읽을 수 있게 셋팅
    var wish_date: Date
    
    var dateString : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: wish_date)
    }
    //->같이갈 인원 선택
    var wish_people: Int
    
    var user_id : String
}
