//
//  RoutineGroupsLabel.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/8/20.
//

import SwiftUI

struct RoutineGroupsLabel: View {
    var routineName: String
    var routineIcon: String? = nil
    
    var body: some View {
        Label {
            Text(routineName)
        } icon: {
            Text(routineIcon ?? "")
        }
    }
}

struct RoutineGroupsLabel_Previews: PreviewProvider {
    static var previews: some View {
        RoutineGroupsLabel(routineName: "Catch a cab", routineIcon: "🏄🏼‍♂️")
    }
}
