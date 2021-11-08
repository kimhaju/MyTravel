//
//  SessionStore.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/08.
//

import Foundation
import Combine
import Firebase


//->로그인 정보를 저장및 확인, 지속성
class SessionStore: ObservableObject {
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session : User? {
        didSet{self.didChange.send(self)}
    }
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen(){
        handle = Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                
                let firestoreUserId = AuthService.getUserId(userId: user.uid)
                firestoreUserId.getDocument { document, error in
                    if let dict = document?.data(){
                        guard let decodedUSer = try? User.init(fromDictionary: dict) else { return }
                        self.session = decodedUSer
                    }
                }
            }else {
                self.session = nil
            }
        })
    }
    
    //->로그아웃
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
