//
//  RingView.swift
//  SwiftUI Design and Code
//
//  Created by Quin’darius Lyles-Woods on 2/25/20.
//  Copyright © 2020 Quin’darius Lyles-Woods. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1),
                style: StrokeStyle(lineWidth: 5))
                .frame(width: 44, height: 44)
                    
            Circle()
                .trim(from: 0.2, to : 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomTrailing),
                        style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0)
            )
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1 , y: 0, z: 0))
                .frame(width: 44, height: 44)
                .shadow(color: Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.1), radius: 3, x: 0, y: 3)
            
            Text("82%")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}



