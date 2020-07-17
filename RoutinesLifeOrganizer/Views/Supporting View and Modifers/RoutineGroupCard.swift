//
//  RoutineGroupCard.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/16/20.
//

import SwiftUI

struct RoutineGroupCard: View {
    @State var routineGroup: RoutineGroup
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.Mustard)
            VStack(alignment: .leading) {
                Text(routineGroup.name)
                    .font(.title2)
                Spacer()
                HStack {
                    Spacer()
                    Text("\(routineGroup.entries.count)")
                        .font(.headline)
                }
            }.padding(.all, 10)
        }//.frame(width: 100, height: 50, alignment: .center)
    }
}

struct RoutineGroupCard_Previews: PreviewProvider {
    static var previews: some View {
        let model: Model = Model()
        
        RoutineGroupCard(routineGroup: model.routineGroups[0]).previewLayout(.sizeThatFits)
        
    }
}
