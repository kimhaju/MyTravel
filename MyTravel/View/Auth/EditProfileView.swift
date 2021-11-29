//
//  EditProfileView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/28.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct EditProfileView: View {
    @EnvironmentObject var userSession: SessionStore
    @State private var country: String = ""
    @State private var username: String = ""
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error : String = ""
    @State private var showingAlert = false
    //->경고 제목
    @State private var alertTitle: String = "회원수정에 문제가 생겼습니다...😔"

    init(session: User?) {
        _country = State(initialValue: session?.country ?? "")
        _username = State(initialValue: session?.username ?? "")
    }
    
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        profileImage = inputImage
    }
    
    func errorCheck() -> String? {
        if username.trimmingCharacters(in: .whitespaces).isEmpty || country.trimmingCharacters(in: .whitespaces).isEmpty || imageData.isEmpty{
            
            return "입력한 수정정보가 올바른지 확인해주세요."
        }
        return nil
    }
    
    func clear() {
        self.username = ""
        self.country = ""
        self.imageData = Data()
        self.profileImage = Image(systemName: "person.crop.circle.badge.plus")
    }
    
    func edit() {
        if let error = errorCheck(){
            self.error = error
            self.showingAlert = true
            self.clear()
            return
        }
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let storageProfileUserId = StorageService.storageProfileId(userId: userId)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        StorageService.editProfile(userId: userId, username: username, country: country, imageDate: imageData, metaData: metadata, storageProfileImageRef: storageProfileUserId, onError: {
            errorMessage in
            
            self.error = errorMessage
            self.showingAlert = true
            return
        })
        
        self.clear()
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                
                Text("Edit Profile").font(.largeTitle)
                
                VStack{
                    Group{
                        if profileImage != nil {
                            profileImage?.resizable()
                                .clipShape(Circle())
                                .frame(width: 200, height: 200)
                                .padding(.top,20)
                                .onTapGesture {
                                    self.showActionSheet = true
                                }
                        }else {
                            WebImage(url: URL(string: userSession.session!.profileImageURL)!)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 200, height: 200).padding(.top, 20).foregroundColor(.gray).onTapGesture {
                                    self.showActionSheet = true
                                }
                            
                        }
                    }
                }
                
                FormField(value: $username, icon: "person.fill", placeholder: "username")
                
                FormField(value: $country, icon: "globe", placeholder: "country")
                
                Button(action: edit){
                    Text("Edit").font(.title).modifier(ButtonModifier())
                }.padding()
                .alert(isPresented: $showingAlert){
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                }
                Text("다음 로그인시 변경사항이 적용됩니다. ")
            }
        }.navigationTitle(userSession.session!.username)
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showImagePicker, imageData: self.$imageData)
        }.actionSheet(isPresented: $showActionSheet){
            ActionSheet(title: Text(""), buttons: [.default(Text("Choose A Photo")){
                
                self.sourceType = .photoLibrary
                self.showImagePicker = true
                
            }, .default(Text("Take a photo")){
                self.sourceType = .camera
                self.showImagePicker = true
                
            }, .cancel()
            
            ])
        }
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
