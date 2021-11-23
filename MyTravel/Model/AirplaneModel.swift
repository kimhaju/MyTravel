//
//  Airplane.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/22.
//

import SwiftUI

//->제이슨 파일 모델 생성
struct AirplaneModel: Codable, Identifiable {
    let id : String
    let airplane: String
    let starting: String
    let departure: String
    let image: String
    let arrive: String
    let week: String
}
