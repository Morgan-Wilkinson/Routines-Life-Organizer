//
//  RoutineGroupsList.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/7/20.
//

import SwiftUI

struct RoutineGroupsList: View {
    @State var routineGroups: [RoutineGroup]
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(routineGroups) { group in
                    NavigationLink(destination: RoutineItemList(routineGroup: group)) {
                        RoutineGroupCard(routineGroup: group)
                    }
                }
            }.padding(.horizontal)
        }
    }
}


struct RoutineGroupsList_Previews: PreviewProvider {
    static var previews: some View {
        let model: Model = Model()
        
        return NavigationView {
            RoutineGroupsList(routineGroups: model.routineGroups)
        }
    }
}

