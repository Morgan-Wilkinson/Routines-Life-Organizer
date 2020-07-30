//
//  NewGroupIcon.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/28/20.
//

import SwiftUI

struct NewGroupIcon: View {
    @Binding var color: Color
    @Binding var icon: String
    @Binding var shape: Int
    
    var body: some View {
        VStack {
            shapeCreator()
        }
    }
    
    func shapeCreator() -> AnyView {
         switch shape {
         case 0:
            return AnyView(
                ZStack{
                    Circle().fill(color)
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Image(systemName: icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                    .aspectRatio(contentMode: .fit)
                    //.padding()
                })
             
         case 1:
            return AnyView(
                ZStack{
                    RoundedRectangle(cornerRadius: 5).fill(color)
                        .aspectRatio(contentMode: .fit)
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                })
             
         default:
            return AnyView(
                ZStack{
                    Ellipse().fill(color)
                        .aspectRatio(contentMode: .fit)
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                })
         }
    }
}

struct NewGroupIcon_Previews: PreviewProvider {
    static var previews: some View {
        NewGroupIcon(color: .constant(Color.red), icon: .constant("sun.min"), shape: .constant(0))
    }
}
