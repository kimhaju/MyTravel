//
//  MainTabView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/12.
//

import SwiftUI
import Introspect

// MARK: - 탭바 셋팅
struct MainTabView: View {
    @StateObject var wishList = MyWishlistViewModel()
    var user: User?
    @State var uiTabarController: UITabBarController?
    @State private var tabSelection: Tabs = .home
    @EnvironmentObject var userSession: SessionStore
    
    var body: some View {
            TabView(selection: $tabSelection) {
                HomeView().tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(Tabs.home)
                
                MyCalendarView().tabItem {
                    Image(systemName: "calendar.badge.plus")
                    Text("MyCalendar")
                }.tag(Tabs.calendar)
                
                MyWishlistView(user: self.userSession.session).tabItem {
                    Image(systemName: "moon.stars")
                    Text("wishlist").offset(x:wishList.showlist ? 0 : -UIScreen.main.bounds.width / 1.6)
                }.tag(Tabs.wishlist)
                
            }.onAppear(){
                UITabBar.appearance().barTintColor = .white
            }.accentColor(.pink).introspectTabBarController { (UITabBarController) in
                UITabBarController.tabBar.isHidden = false
                uiTabarController = UITabBarController
            }.onDisappear{
                uiTabarController?.tabBar.isHidden = false
            }
    }
}

//->탭바를 감추기 위한 열거형 준비
enum Tabs {
    case home,calendar,wishlist
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
       MainTabView()
    }
}

