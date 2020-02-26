//
//  RingView.swift
//  SwiftUI Design and Code
//
//  Created by Quin’darius Lyles-Woods on 2/25/20.
//  Copyright © 2020 Quin’darius Lyles-Woods. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
    var color2 = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    var width: CGFloat = 120
    var height: CGFloat = 120
    var percent: CGFloat = 30
    
    
    var body: some View {
        
        let multiplier = width / 44
        let progress = percent / 100
            
       return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1),
                style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
                    
            Circle()
                .trim(from: 1 - progress, to : 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1 ), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomTrailing),
                        style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0)
            )
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1 , y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}



