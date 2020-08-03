//
//  RoutineDashboard.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/17/20.
//

import SwiftUI

struct RoutineDashboard: View {
    @EnvironmentObject var model: Model
    @State var showSheet: Bool = false
    let column = [GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HighlightedRoutines(routineGroup: self.model.routineGroups[0])
                    .frame(height: geometry.size.height / 3.75)
                Divider()
                RoutineGroupsList(routineGroups: self.model.routineGroups).environmentObject(model)

                NavigationLink(destination: NewGroup(dismissView: $showSheet).environmentObject(model)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.Peach)
                        Text("Add New Group")
                    }
                }.padding(.all, 10)
                .frame(height: geometry.size.height / 9)
            }
        }.navigationTitle("Dashboard")
    }
}

struct RoutineOverview_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        NavigationView {
            RoutineDashboard().environmentObject(model)
        }
    }
}
