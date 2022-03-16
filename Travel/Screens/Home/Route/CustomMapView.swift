//
//  CustomMapView.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import SwiftUI
import MapKit

struct CustomMapView: View {
    var body: some View {
        UIKitMap()
    }
}

struct UIKitMap: UIViewRepresentable {
    @ObservedObject var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.4, longitude: 34.5), latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.showsUserLocation = true
        mapView.setRegion(region, animated: true)
        mapView.showsCompass = true
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}
