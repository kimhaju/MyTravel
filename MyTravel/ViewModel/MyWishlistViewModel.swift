//
//  MyWishlistViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/16.
//

import Foundation
import Firebase

class MyWishlistViewModel: ObservableObject {
    
    @Published var showlist = false
    @Published var wishItems = [WishlistModel]()
    
    private var db = Firestore.firestore()
    //->조회
    
    //->11.25일 버그 고침 어팬드 데이터에서 리턴 데이터로 바꿈 그랬더니 다시 조회해도 같은 항목이 중복으로 뜨지 않음.
    func getWishItem(userId: String) {
        db.collection("wishlist").whereField("user_id", isEqualTo: userId).addSnapshotListener { snapshot, error in
            
            guard let documents = snapshot?.documents else {
                print("데이터를 찾을수 없습니다.")
                return
            }
            self.wishItems = documents.map { snap -> WishlistModel in
                let data = snap.data()
                
                let id = snap.documentID
                
                let name = data["wish_name"] as? String ?? ""
                let address = data["wish_address"] as? String ?? ""
                let details = data["wish_details"] as? String ?? ""
                let image = data["wish_image"] as? String ?? ""
                let price = data["wish_price"] as? String ?? ""
                let date = (data["wish_date"] as? Timestamp)?.dateValue() ?? Date()
                let people = data["wish_people"] as? Int
                let userId = data["user_id"] as! String
                
                return WishlistModel(id: id, wish_name: name, wish_address: address, wish_details: details, wish_image: image, wish_price: price, wish_date: date, wish_people: people!, user_id: userId)
            }
        }
    }
}


////->특정 조건을 검색함으로 여러 문서를 띄움
//db.collection("wishlist").whereField("user_id", isEqualTo: userId).getDocuments { (snapshot, error) in
//    if error != nil{
//        print("해당 정보가 없습니다!")
//        return
//    }
//
//    for item in snapshot!.documents {
//
//        let id = item.documentID
//        let name = item.get("wish_name") as! String
//        let address = item.get("wish_address") as! String
//        let details = item.get("wish_details") as! String
//        let image = item.get("wish_image") as! String
//        let price = item.get("wish_price") as! String
//        let date = (item.get("wish_date") as? Timestamp)?.dateValue() ?? Date()
//        let people = item.get("wish_people") as! Int
//        let userId = item.get("user_id") as! String
//
//        self.wishItems.append(WishlistModel(id: id, wish_name: name, wish_address: address, wish_details: details, wish_image: image, wish_price: price, wish_date: date, wish_people: people, user_id: userId))
//
//    }
//}
