//
//  CustomShape.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import Foundation
import SwiftUI


struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: .init(width: 10, height: 10))
        return Path(path.cgPath)
    }
}
