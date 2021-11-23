//
//  TravelPackageItem.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/16.
//

import Foundation
import Firebase

struct TravelItemModel: Identifiable {
   
    var id : String
    var item_name: String
    var item_address: String
    var item_details: String
    var item_image: String
    var item_price: String
    var item_ratings: String

}

struct DetailItemViewModel: Identifiable, Codable{
    var id = UUID().uuidString
    var item_name: String
    var item_address: String
    var item_details: String
    var item_image: String
    var item_ratings: String
}
