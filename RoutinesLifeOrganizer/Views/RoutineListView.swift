//
//  RoutineListView.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/7/20.
//

import SwiftUI

struct RoutineListView: View {
    @State var leaders: [RoutineLeader]
    
    var body: some View {
        List{
            ForEach(leaders) { leader in
                Section(header: Text(leader.name)) {
                    OutlineGroup(leader.children!, children: \.relatedRoutines) { item in
                        Text(item.name)
                    }
                }
            }
        }.listStyle(SidebarListStyle())
    }
}

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        var test2: RoutineItem = RoutineItem(name: "Walk the dog!", motherGroup: "😣 Chores")
        test2.name = "MMM"
        test2.relatedRoutines = [RoutineItem(name: "Aht", motherGroup: "Yikes")]
        
        var leader: [RoutineLeader] = [RoutineLeader(name: "Test", progress: 15.0, children: [.dog,.dog]), RoutineLeader(name: "Gupypy", progress: 15.0, children: [.dog,.dog, test2])]
        
        return NavigationView {
            RoutineListView(leaders: leader)
        }
    }
}
