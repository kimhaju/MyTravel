//
//  HomeViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/15.
//

import SwiftUI
import Firebase

class HomeViewModel: ObservableObject {
    
    //->검색창
    @Published var search = ""
    //->여행지
    @Published var travelItems = [TravelItemModel]()

    init() {
        
        let db = Firestore.firestore()
        db.collection("travel_items").addSnapshotListener { snapshot, error in
            if error != nil {
                print("데이터가 존재하지 않습니다.")
                return
            }
            for data in snapshot!.documentChanges {
                
                let id = data.document.documentID
                let name = data.document.get("item_name") as? String ?? ""
                let address = data.document.get("item_address") as? String ?? ""
                let details = data.document.get("item_details") as? String ?? ""
                let image = data.document.get("item_image") as? String ?? ""
                let ratings = data.document.get("item_ratings") as? String ?? ""
                let price = data.document.get("item_price") as? String ?? ""
                
                self.travelItems.append(TravelItemModel(id: id, item_name: name, item_address: address, item_details: details, item_image: image, item_price: price, item_ratings: ratings))
            }
        }
    }

}
    
//->디테일 메서드 구현
//func fetchData(documentId: String) {
//
//        let docref = db.collection("travel_items").document(documentId)
//
//        docref.getDocument { documnet, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                if let documnet = documnet {
//                    let id = documnet.documentID
//
//                    let data = documnet.data()
//                    let name = data?["item_name"] as? String ?? ""
//                    let address = data?["item_address"] as? String ?? ""
//                    let details = data?["item_details"] as? String ?? ""
//                    let image = data?["item_image"] as? String ?? ""
//                    let ratings = data?["item_ratings"] as? String ?? ""
//
//                    print(id)
//
//                    self.travelItems = [TravelItemModel(id: id, item_name: name, item_address: address, item_details: details, item_image: image, item_ratings: ratings)]
//                }
//            }
//        }
//
//}


//

//let id = snapshot.documentID
//let name = data["item_name"] as? String ?? ""
//let address = data["item_address"] as? String ?? ""
//let details = data["item_details"] as? String ?? ""
//let image = data["item_image"] as? String ?? ""
//let price = data["item_price"] as? String ?? ""
//let ratings = data["item_ratings"] as? String ?? ""
//
//return TravelItemModel(id: id, item_name: name, item_address: address, item_details: details, item_image: image, item_price: price, item_ratings: ratings)
