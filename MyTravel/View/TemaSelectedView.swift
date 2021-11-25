//
//  TemaSelectedView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/25.
//

import SwiftUI

struct TemaSelectedView: View {
    
    @State private var selectValue = 0
    
    var body: some View {
        HStack(spacing: 60){
            Picker(selection: $selectValue, label: Text("pick")){
                Text("season").tag(0)
                Text("feeling").tag(1)
                Text("all").tag(2)
            }
        }.pickerStyle(SegmentedPickerStyle())
        .padding(.vertical)
        .foregroundColor(Color(UIColor.systemIndigo))
        
        if (selectValue == 0){
            SeasonTema()
        }
        else if (selectValue == 1){
            FeelingTema()
        }
        else if (selectValue == 2){
            AllTema()
        }
    }
}


//->시즌 테마
struct SeasonTema: View {
    
    @StateObject var homeModel = HomeViewModel()
    
    var body: some View {
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
        .padding().foregroundColor(Color(UIColor.systemIndigo)).edgesIgnoringSafeArea(.bottom)
    }
}


//->기분 테마
struct FeelingTema: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20){
                
                Image("alone").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12)
                
                Image("romance").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12)
                
                Image("sad").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12)
                
                Image("night").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12)
                
                Image("temple").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12)
            }
        }.padding(.trailing,-20)
        .padding().foregroundColor(Color(UIColor.systemIndigo)).edgesIgnoringSafeArea(.bottom)
    }
}

struct AllTema: View {
    
    var body: some View {
        VStack{
            Text("여기에 봄 여름 테마 다 담기")
        }
    }
}
