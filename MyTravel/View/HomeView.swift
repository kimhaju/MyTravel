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
                VStack(alignment: .leading){
                    
                    HStack {
                        Image(systemName: "line.horizontal.3.decrease").resizable().frame(width: 24, height: 24)
                        Spacer()
                        
                        //->여기에 입력한 데이터 정보 셋팅
                        Text("korea").font(.system(.headline, design: .rounded))
                        Text("seoul").fontWeight(.ultraLight)
                        Spacer()
                        
                        //->유저 프로파일 사진
                        Image("baseUser").resizable().aspectRatio(contentMode: .fill).frame(width: 36, height: 36).clipShape(Circle())
                    }
                    
                    // MARK: - profile, search
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            Text("환영합니다!").font(.largeTitle)
                            Text("haju").font(.title).fontWeight(.heavy)
                        }
                        Text("여행을 떠나볼까요?").font(.subheadline).fontWeight(.light)
                    }
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
                    HStack {
                        VStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                Image(systemName: "airplane").foregroundColor(.white).padding(.all, 18).background(Color.blue.opacity(0.8)).cornerRadius(12).shadow(radius: 2)
                            }
                            Text("Flights").font(.footnote).bold()
                        }
                        Spacer()
                        VStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                Image(systemName: "bed.double.fill").foregroundColor(.white).padding(.all, 18).background(Color.orange.opacity(0.8)).cornerRadius(12).shadow(radius: 2)
                            }
                            Text("Hotels").font(.footnote).bold()
                        }
                        Spacer()
                        VStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                Image(systemName: "location.fill").foregroundColor(.white).padding(.all, 18).background(Color.purple.opacity(0.8)).cornerRadius(12).shadow(radius: 2)
                            }
                            Text("places").font(.footnote).bold()
                        }
                        Spacer()
                        VStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                                Image(systemName: "rectangle.grid.2x2.fill").foregroundColor(.white).padding(.all, 18).background(Color.red.opacity(0.8)).cornerRadius(12).shadow(radius: 2)
                            }
                            Text("more").font(.footnote).bold()
                        }
                    }.padding()
                    
                    Spacer()
                    
                    // MARK: - trips
                    HStack {
                        Text("your").font(.largeTitle)
                        Text("trips").font(.title).fontWeight(.heavy)
                    }.padding(.vertical)
                    
                    HStack(spacing:60){
                        Text("futured").bold()
                        Text("past").foregroundColor(.secondary)
                        Text("all").foregroundColor(.secondary)
                    }.padding(.vertical)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            NavigationLink(
                                destination: ItineraryDetail()){
                            Image("water").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
                            }.buttonStyle(PlainButtonStyle())
                            Image("nature").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 270).cornerRadius(12)
                        }
                    }.padding(.trailing,-20)
                }.padding().foregroundColor(Color(UIColor.systemIndigo)).edgesIgnoringSafeArea(.bottom)
            }.navigationBarTitle("").navigationBarHidden(true)
        }.accentColor(Color(UIColor.systemIndigo))
    }
}
// MARK: - 디테일 페이지
struct ItineraryDetail: View {
    var body: some View {
        VStack(alignment: .leading){
            VStack {
                Image("water").resizable().aspectRatio(contentMode: .fill).frame(width: 390,height: 450)
            }.clipShape(Curves(corner: .bottomLeft, radius: 35)).clipShape(Curves(corner: .bottomRight, radius: 35)).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
            VStack(alignment: .leading, spacing: 8){
                HStack {
                    Text("waterfall").font(.largeTitle).fontWeight(.heavy)
                    Text("jeju").font(.largeTitle).fontWeight(.ultraLight).foregroundColor(.secondary)
                }
                //->별점 페이지
                HStack {
                    Image(systemName: "star.fill")
                    Text("4.7").font(.headline).fontWeight(.bold)
                }
                
                HStack(spacing: 15){
                    VStack(spacing: 15){
                        ZStack {
                            Image("plane").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
                            
                            VStack{
                                Spacer()
                                Text("Tickets").fontWeight(.heavy)
                            }.padding()
                        }.frame(width: 165, height: 165).cornerRadius(20)
                        
                        ZStack {
                            Image("map").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
                            
                            VStack{
                                Spacer()
                                Text("Hotels").fontWeight(.heavy)
                            }.padding()
                        }.frame(width: 165, height: 165).cornerRadius(20)
                    }
                    VStack (spacing: 15){
                        ZStack {
                            Image("place").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
                            
                            VStack{
                                Spacer()
                                Text("places").fontWeight(.heavy)
                            }.padding()
                        }.frame(width: 165, height: 165).cornerRadius(20)
                        
                        ZStack {
                            Image("cloud").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
                            
                            VStack{
                                Spacer()
                                Text("weather").fontWeight(.heavy)
                            }.padding()
                        }.frame(width: 165, height: 165).cornerRadius(20)
                    }
                }
            }
        }
    }
    
//    width: 390,
}

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

//            Button(action: {session.logout()}){
//                Text("로그아웃 피슝").font(.title).modifier(ButtonModifier())
//            }
