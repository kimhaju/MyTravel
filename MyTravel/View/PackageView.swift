//
//  PackageView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/17.
//

import SwiftUI

struct PackageView: View {
    
    @StateObject var homeModel = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                        Text("tema").font(.largeTitle)
                        Text("trips").font(.title).fontWeight(.heavy)
                Spacer()
                    }.padding(.vertical)

                    HStack(spacing:60){
                        Text("season").bold()
                        Text("feeling").foregroundColor(.secondary)
                        Text("all").foregroundColor(.secondary)
                    }.padding(.vertical)
            
            //->11.23 에러 고침 인바이런 먼트 오브젝트를 받아들일수 있게 작업을 미리 해줘야 했었음. 감사합니다 스택 오버 플로우 스크롤 뷰에 인바리언 먼트 오브젝트 타입을 추가해줌 !
//                                https://stackoverflow.com/questions/57582813/swiftui-thread-1-fatal-error-no-observable-object-of-type-myobject-type-fou

                    ScrollView (.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            NavigationLink(
                               
                                destination: TravelScrollView().environmentObject(homeModel)){
                            Image("spring").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
                            }.buttonStyle(PlainButtonStyle())
                            Image("summer").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
                            Image("fall").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
                            Image("winter").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
                        }
                    }.padding(.trailing,-20)
            
                }.padding().foregroundColor(Color(UIColor.systemIndigo)).edgesIgnoringSafeArea(.bottom)
    }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView()
    }
}
