//
//  HotelModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/26.
//

import Foundation

struct HotelModel: Codable, Identifiable {
    
    let id : String
    let hotel_name : String
    let hotel_locate: String
    let image: URL
    let check_in: String
    let details: String
    let hotel_ratings : String

}

