//
//  AuthService.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/06.
//

import Foundation
import Firebase

class AuthService {
    
    // MARK: - firestore 저장
    
    static var storeRoot = Firestore.firestore()
    static func getUserId(userId: String) -> DocumentReference {
        //->문서에 저장할때 유저라는 항목에 저장.
        return storeRoot.collection("users").document(userId)
    }
    
    // MARK: - 회원가입 메서드
    static func signUp(username: String, email: String, password: String,country: String, imageData: Data, onSuccess: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else { return }
            
            let storageProfileUserId = StorageService.storageProfileId(userId: userId)
            
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            StorageService.saveProfile(userId: userId, username: username, email: email, country: country, imageData: imageData, metaData: metadata, storageProfileImageRef: storageProfileUserId, onSuccess: onSuccess, onError: onError)
        }
    }
    
    //->로그인 처리 메서드
    // MARK: - login
    static func signIn(email: String, password: String, onSuccess: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else { return }
            
            let firestoreUserId = getUserId(userId: userId)
            
            firestoreUserId.getDocument { (documet, error) in
                if let dict = documet?.data() {
                    guard let decodedUser = try? User.init(fromDictionary: dict) else { return }
                    onSuccess(decodedUser)
                }
            }
        }
    }
}

