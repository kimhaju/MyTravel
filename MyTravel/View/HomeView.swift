//
//  HomeView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/08.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        
        
        // MARK: - header
        NavigationView {
        ScrollView(.vertical, showsIndicators: false){
        VStack{
            ProfileHeaderViewModel(user: self.session.session)
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass").foregroundColor(Color(UIColor.systemIndigo)).padding()

                            //->검색창
                            Text("원하는 여행지를 검색해보세요.").font(.footnote).padding()
                            Spacer()

                            Divider().frame(height: 24)
                            Image(systemName: "arrowtriangle.down.fill").resizable().frame(width: 8, height: 8).padding()

                        }.foregroundColor(Color.secondary.opacity(0.5)).background(Color.gray.opacity(0.1)).cornerRadius(80).shadow(radius: 1).padding()
                    }
                    // MARK: - travel button

            TravelButtonViewModel()

                    // MARK: - trips
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
                                    destination: DetailTravelPageViewModel()){
                                Image("water").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
                                }.buttonStyle(PlainButtonStyle())
                                Image("nature").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)

                            }
                        }.padding(.trailing,-20)
                    }.padding().foregroundColor(Color(UIColor.systemIndigo)).edgesIgnoringSafeArea(.bottom)
                }
            }
        }
    }
}

// MARK: - 나중에 뺄거
//->굴곡주기
struct Curves: Shape {
    var corner: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath (roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


