//
//  RoutineGroupsList.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/7/20.
//

import SwiftUI

struct RoutineGroupsList: View {
    @State var model: Model = Model()
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(model.routineGroups) { group in
                    NavigationLink(destination: RoutineItemList(routineGroup: group)) {
                        RoutineGroupCard(routineGroup: group)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Graphics")
    }
}


struct RoutineGroupsList_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationView {
            RoutineGroupsList()
        }
    }
}

