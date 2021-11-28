//
//  EditProfileView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/28.
//

import SwiftUI

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
    @State private var alertTitle: String = "회원가입에 문제가 생겼습니다...😔"

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
