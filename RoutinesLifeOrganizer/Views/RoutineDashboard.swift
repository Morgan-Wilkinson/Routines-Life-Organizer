//
//  RoutineDashboard.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/17/20.
//

import SwiftUI

struct RoutineDashboard: View {
    @State var model: Model
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.DarkTeal)
                        .frame(width:  geometry.size.width, height:  geometry.size.height / 4)
                    VStack {
                        HighlightedRoutines(routineGroup: self.model.routineGroups[0])
                            .frame(height: geometry.size.height / 4)
                        Divider()
                        RoutineGroupsList(routineGroups: self.model.routineGroups)
                    }
                }
            }
        }
    }
}

struct RoutineOverview_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        NavigationView {
            RoutineDashboard(model: model)
        }
    }
}
