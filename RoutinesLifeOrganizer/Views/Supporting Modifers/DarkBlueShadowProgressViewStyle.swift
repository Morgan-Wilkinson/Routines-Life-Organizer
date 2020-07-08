//
//  DarkBlueShadowProgressViewStyle.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/6/20.
//

import SwiftUI

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.3), radius: 0.4)
    }
}
