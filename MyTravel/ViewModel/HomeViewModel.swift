//
//  HomeViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/15.
//

import SwiftUI
import Firebase

class HomeViewModel: NSObject, ObservableObject{
    
    //->검색창
    @Published var search = ""
    //->여행지
    @Published var travelItems = [TravelItemModel]()
    private var db = Firestore.firestore()
    
    func travelFetchData() {
        db.collection("travel_items").addSnapshotListener { snapshot, error in
            guard let document = snapshot?.documents else {
                print("데이터가 존재하지 않습니다.")
                return
            }
            self.travelItems = document.map { snap -> TravelItemModel in
        
                let data = snap.data()
        
                let id = snap.documentID
                let name = data["item_name"] as? String ?? ""
                let address = data["item_address"] as? String ?? ""
                let details = data["item_details"] as? String ?? ""
                let image = data["item_image"] as? String ?? ""
                let ratings = data["item_ratings"] as? String ?? ""
        
                return TravelItemModel(id: id, item_name: name, item_address: address, item_details: details, item_image: image, item_ratings: ratings)
            }
        }
    }
}
    
    //->디테일 보기 메서드
//    func travelDetailFetchData() {
//
//        let ref = db.collection("travel_items").document("C8jzTFzLrDGwRYJz7z41")
//
//        ref.getDocument { document, error in
//            guard error == nil else {
//                print("해당 데이터에 문제가 생김: ", error ?? "")
//                return
//            }
//            if let document = document, document.exists {
//
//
//            }
//        }




