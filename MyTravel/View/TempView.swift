//
//  TempView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/22.
//

import SwiftUI

struct TempView: View {
    
    var travel : TravelItemModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text(travel.item_details)
        }
    }
}

//struct TempView_Previews: PreviewProvider {
//    static var previews: some View {
//        TempView()
//    }
//}
