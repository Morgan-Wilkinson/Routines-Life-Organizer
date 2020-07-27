//
//  RoutinesLifeOrganizerApp.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/4/20.
//

import SwiftUI

@main
struct RoutinesLifeOrganizerApp: App {
    let model: Model = Model()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RoutineDashboard().environmentObject(model)
            }
        }
    }
}

