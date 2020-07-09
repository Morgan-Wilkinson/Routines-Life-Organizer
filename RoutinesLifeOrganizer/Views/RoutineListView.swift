//
//  RoutineListView.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/7/20.
//

import SwiftUI

struct RoutineListView: View {
    @State var model: Model = Model()
    @State private var selection: Set<String> = []
    
    var body: some View {
        NavigationView {
            List(selection: $selection) {
                ForEach(model.routineGroups) { group in
                    //Section(header: Text(group.name)) {
                        OutlineGroup(group.entries, children: \.children) { entry in
                            
                            Label(entry.name, systemImage: entry.icon)
                        }
                    //}
                }
            }.listStyle(SidebarListStyle())
        }.navigationTitle("Graphics")
    }
}

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationView {
            RoutineListView()
        }
    }
}
