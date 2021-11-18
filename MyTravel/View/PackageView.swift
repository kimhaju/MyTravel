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
                        Text("futured").bold()
                        Text("past").foregroundColor(.secondary)
                        Text("all").foregroundColor(.secondary)
                    }.padding(.vertical)

                    ScrollView (.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            NavigationLink(
                                destination: TravelScrollView()){
                            Image("water").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
                            }.buttonStyle(PlainButtonStyle())
                            Image("nature").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
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
