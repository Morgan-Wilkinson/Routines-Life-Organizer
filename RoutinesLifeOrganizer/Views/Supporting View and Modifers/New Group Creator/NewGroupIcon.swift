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
                        Image(systemName: icon)
                            .font(.system(size: 45))
                            .padding()
                            .background(color)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .frame(width: 90, height: 90)
                    })
             
            default:
                return AnyView(
                    ZStack{
                        Image(systemName: icon)
                            .font(.system(size: 45))
                            .padding()
                            .background(color)
                            .clipShape(Circle())
                            .frame(width: 90, height: 90)
                    })
         }
    }
}

struct NewGroupIcon_Previews: PreviewProvider {
    static var previews: some View {
        NewGroupIcon(color: .constant(Color.red), icon: .constant("paperplane.fill"), shape: .constant(0))
        
        NewGroupIcon(color: .constant(Color.red), icon: .constant("music.mic"), shape: .constant(0))
        
        NewGroupIcon(color: .constant(Color.red), icon: .constant("music.mic"), shape: .constant(1))
    }
}
