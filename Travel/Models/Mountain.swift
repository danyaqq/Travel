//
//  Mountain.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import Foundation


struct Mountain: Hashable, Identifiable {
    var id = UUID().uuidString
    let title: String
    let image: String
    let locationDescription: String
    let height: Double
    let coordinat: Coordinate
    let summary: String
    let conditions: [Condition]
    static let mountains = [
        Mountain(title: "Merbabu", image: "Bitmap", locationDescription: "Mt. Merbabu, Suroteleng, Selo, Kabupaten Boyolali, Jawa Tengah", height: 3.145, coordinat: Coordinate(latitude: 55.4, longitude: 34.4), summary: "Mount Merbabu is a Strato type volcano (see Volcano) that is located geographically at 7.5 ° South and 110.4 ° East. Administratively the mountain is located in the area of Magelang Regency on the west slope and Boyolali Regency on the east and south slope, Semarang Regency on the northern slope, Central Java Province.", conditions: [Condition(title: "Weather", description: "Rain 14°C", image: "rain"), Condition(title: "Humidity", description: "48%", image: "hum"), Condition(title: "Land Slope", description: "70° - 85°", image: "land")]),
        Mountain(title: "Selek", image: "Bitmap 2", locationDescription: "Moscow, Litovskit b-r. st., Selo, Yasenevo District", height: 1.243, coordinat: Coordinate(latitude: 55.42, longitude: 34.47), summary: "Mount Selek is a beautifull mountain. Administratively the mountain is located in the area of Magelang Regency on the west slope and Boyolali Regency on the east and south slope, Semarang Regency on the northern slope, Central Yasenevo Province.", conditions: [Condition(title: "Weather", description: "Rain 18°C", image: "rain"), Condition(title: "Humidity", description: "28%", image: "hum"), Condition(title: "Land Slope", description: "60° - 75°", image: "land")])
    ]
}

struct Coordinate: Hashable {
    let latitude: Double
    let longitude: Double
}

struct Condition: Hashable {
    let title: String
    let description: String
    let image: String
}

