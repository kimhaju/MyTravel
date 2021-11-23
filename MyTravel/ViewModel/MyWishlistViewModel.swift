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
    
    func getWishItem(userId: String) {
        let db = Firestore.firestore()
        
        //->특정 조건을 검색함으로 여러 문서를 띄움
        db.collection("wishlist").whereField("user_id", isEqualTo: userId).getDocuments { (snapshot, error) in
            if error != nil{
                print("해당 정보가 없습니다!")
                return
            }
            
            for item in snapshot!.documents {
                
                let id = item.documentID
                let name = item.get("wish_name") as! String
                let address = item.get("wish_address") as! String
                let details = item.get("wish_details") as! String
                let image = item.get("wish_image") as! String
                let price = item.get("wish_price") as! String
                let wish_date = item.get("wish_date") as! String
                let userId = item.get("user_id") as! String
                
                self.wishItems.append(WishlistModel(id: id, wish_name: name, wish_address: address, wish_details: details, wish_image: image, wish_price: price, wish_date: wish_date, user_id: userId))
         
            }
        }
    }
}
