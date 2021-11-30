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
                    Image("spring").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12).overlay(ImageOver(word: "봄 시즌 할인 20%", color: "Pink"), alignment: .topLeading)
                }.buttonStyle(PlainButtonStyle())
                Image("summer").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12).overlay(ImageOver(word: "여름 시즌 할인 15%", color: "Purple"), alignment: .topLeading)
                Image("fall").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12).overlay(ImageOver(word: "가을 시즌 할인 20%", color: "Orange"), alignment: .topLeading)
                Image("winter").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12).overlay(ImageOver(word: "겨울 시즌 할인 10%", color: "Color"), alignment: .topLeading)
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
                
                Image("alone").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12).blur(radius: 2)
                    .overlay(ImageOveraly(word: "혼자 떠나볼까요?"), alignment: .center)
                
                Image("romance").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12).blur(radius: 2)
                    .overlay(ImageOveraly(word: "동화같은 여행을 원한다면?"), alignment: .center)
                
                Image("sad").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12)
                    .blur(radius: 2)
                    .overlay(ImageOveraly(word: "기분 전환 하러가요!"), alignment: .center)
                
                Image("night").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12)
                    .blur(radius: 2)
                    .overlay(ImageOveraly(word: "야경을 즐기고 싶다면?"), alignment: .center)
                
                Image("temple").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 200).cornerRadius(12)
                    .blur(radius: 2)
                    .overlay(ImageOveraly(word: "역사 탐방도 좋죠!"), alignment: .center)
            }
        }.padding(.trailing,-20)
        .padding().foregroundColor(Color(UIColor.systemIndigo)).edgesIgnoringSafeArea(.bottom)
    }
}

struct ImageOveraly: View {
    @State var word = ""
    
    var body: some View {
        ZStack {
            Text(word).font(.system(size: 23)).fontWeight(.bold).padding(6).foregroundColor(.white)
        }.padding(6)
    }
}

struct ImageOver: View {
    @State var word = ""
    @State var color = ""
    
    var body: some View {
        ZStack {
            Text(word).font(.callout).padding(6).foregroundColor(.white)
        }.background(Color(color))
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}


struct AllTema: View {
    
    var body: some View {
        VStack{
            Text("여기에 봄 여름 테마 다 담기")
        }
    }
}
