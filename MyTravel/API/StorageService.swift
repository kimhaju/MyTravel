//
//  StorageService.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/06.
//

import Foundation
import Firebase

class StorageService {
    
    static var storage = Storage.storage()
    
    //->저장될 파이어베이스 콘솔 주소
    static var storageRoot = storage.reference(forURL: "gs://mytravelapp-fa2ef.appspot.com/profile")
    
    //->스토리지 경로에 할당
    static var storageProfile = storageRoot.child("profile")
    
    //->프로파일 아이디에서 실행하는 작업
    static func storageProfileId(userId: String) -> StorageReference {
        return storageProfile.child(userId)
    }
    
    //->프로파일 이미지 저장(메타 데이터, 이미지에 대한 정보를 삽입 )
    static func saveProfile(userId:String, username: String, email: String, country:String ,imageData: Data, metaData: StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void){
        
        storageProfileImageRef.putData(imageData, metadata: metaData){ (StorageMetadata, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            storageProfileImageRef.downloadURL { (url, error) in
                if let metaImageURL = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges { error in
                            if error != nil {
                                
                                onError(error!.localizedDescription)
                                return
                            }
                        }
                    }
                    let firestoreUserId = AuthService.getUserId(userId: userId)
                    let user = User.init(uid: userId, email: email, country: country, profileImageURL: metaImageURL, username: username, searchName: username.splitString(), bio: "")
                    
                    //->사용자가 설정하기 위해서 사전으로 변환
                    guard let dict = try? user.asDictionary() else { return }
                    
                    firestoreUserId.setData(dict){ error in
                        if error != nil {
                            onError(error!.localizedDescription)
                        }
                    }
                    
                    onSuccess(user)
                }
            }
        }
        
    }
}
