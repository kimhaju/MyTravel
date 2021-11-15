//
//  TravelButtonViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/15.
//

import SwiftUI
import CoreLocation

class TravelButtonViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastSeenLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
       
       private let locationManager: CLLocationManager
       
       override init() {
           locationManager = CLLocationManager()
           authorizationStatus = locationManager.authorizationStatus
           
           super.init()
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyBest
           locationManager.startUpdatingLocation()
       }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastSeenLocation = locations.first
        fetchCountryAndCity(for: locations.first)
    }

    func fetchCountryAndCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.currentPlacemark = placemarks?.first
        }
    }
}

//@Published var locationManager = CLLocationManager()
////->자세한 위치 정보
//@Published var userLocation: CLLocation!
//@Published var userAddress = ""
//@Published var noLocation = false
//
//
//func requestPermission() {
//    locationManager.requestWhenInUseAuthorization()
//}
//
//func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//
//    //->연결 확인
//    switch manager.authorizationStatus {
//    case .authorizedWhenInUse:
//        print("계정으로 위치정보 전달")
//        self.noLocation = false
//        manager.requestLocation()
//
//    case .denied:
//        print("위치정보 허용이 거부됨")
//        self.noLocation = true
//    default:
//        print("알수없음")
//        self.noLocation = false
//        //->위치 불러오기
//        locationManager.requestWhenInUseAuthorization()
//    }
//}
//
//func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//    print(error.localizedDescription)
//}
//
//func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    //->유저 위치 정보 불러오기
//
//    self.userLocation = locations.last
//    self.extracLocation()
//}
//
//func extracLocation() {
//    CLGeocoder().reverseGeocodeLocation(self.userLocation) { res, err in
//        guard let safeData = res else { return }
//
//        var address = ""
//
//        // 저장한 내 위치
//
//        address += safeData.first?.name ?? ""
//        address += ", "
//        address += safeData.first?.locality ?? ""
//
//        self.userAddress = address
//    }
//}
