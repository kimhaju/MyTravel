//
//  LocationViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/15.
//

import SwiftUI
import Combine
import MapKit
import Introspect

struct AnnotationItem: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


final class LocationManager: NSObject, ObservableObject {
    @Published var location: CLLocation?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.898150, longitude: -77.034340),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    private var hasSetRegion = false
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location
            
            if !hasSetRegion {
                self.region = MKCoordinateRegion(center: location.coordinate,
                                                 span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                hasSetRegion = true
            }
        }
    }
}

struct LocationViewModel: View {
    @ObservedObject private var locationManager = LocationManager()
    @State var uiTabarController: UITabBarController?
        
        var homeLocation : [AnnotationItem] {
            guard let location = locationManager.location?.coordinate else {
                return []
            }
            return [.init(name: "Home", coordinate: location)]
        }
        
        var body: some View {
            VStack{
                Map(coordinateRegion: $locationManager.region, annotationItems: homeLocation) {
                    MapPin(coordinate: $0.coordinate)
                }
                .frame(maxWidth: .infinity)
                
            }.introspectTabBarController { (UITabBarController) in
                UITabBarController.tabBar.isHidden = true
                uiTabarController = UITabBarController
            }.onDisappear{
                uiTabarController?.tabBar.isHidden = false
            }
           
        }
}

