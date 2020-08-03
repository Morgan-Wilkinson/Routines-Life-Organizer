//
//  RoutinePreviewCard.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/22/20.
//

import SwiftUI

struct RoutinePreviewCard: View {
    @State var routine: RoutineItem
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color.Peach)
                VStack(alignment: .leading) {
                    HStack {
                        Text(routine.name)
                            .font(.title)
                            .padding(.horizontal)
                        Spacer()
                    }
                    if !(routine.notes == nil) {
                        HStack {
                            Text(routine.notes ?? "")
                                .lineLimit(1)
                                .padding([.leading, .bottom, .trailing], 10)
                            Spacer()
                        }
                    }
                }
            }.padding(.all, 10)
        }
    }
}

struct RoutinePreviewCard_Previews: PreviewProvider {
    static var previews: some View {
        var routine: RoutineItem = .dog
        routine.notes = "\t Mauris blandit, magna a pharetra accumsan, diam dolor consequat mi, imperdiet tincidunt tellus mauris in sapien. Praesent semper, sem vitae consequat finibus, ligula ipsum hendrerit nunc, vel blandit erat magna sit amet enim. Donec risus libero, sagittis vitae lacinia a, fringilla maximus lacus. Nullam eleifend, leo a mattis pretium, metus ligula rhoncus ex, sit amet sagittis ex augue sit amet est. Aliquam tristique nisl eleifend, cursus lacus in, dapibus felis. In at lacus sit amet risus blandit feugiat in in libero. Sed malesuada ante in lorem tristique, eu malesuada ante bibendum. Cras molestie at sem non porta. Nunc quis congue ex. Nam sit amet elit mauris. Mauris mauris elit, ultricies vitae magna vitae, sodales suscipit magna. Nulla vehicula orci sed. \n\n Mauris blandit, magna a pharetra accumsan, diam dolor consequat mi, imperdiet tincidunt tellus mauris in sapien. Praesent semper, sem vitae consequat finibus, ligula ipsum hendrerit nunc, vel blandit erat magna sit amet enim. Donec risus libero, sagittis vitae lacinia a, fringilla maximus lacus. Nullam eleifend, leo a mattis pretium, metus ligula rhoncus ex, sit amet sagittis ex augue sit amet est. Aliquam tristique nisl eleifend, cursus lacus in, dapibus felis. In at lacus sit amet risus blandit feugiat in in libero. Sed malesuada ante in lorem tristique, eu malesuada ante bibendum. Cras molestie at sem non porta. Nunc quis congue ex. Nam sit amet elit mauris. Mauris mauris elit, ultricies vitae magna vitae, sodales suscipit magna. Nulla vehicula orci sed."
        
        return RoutinePreviewCard(routine: routine)
            //.frame(width: 400, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
