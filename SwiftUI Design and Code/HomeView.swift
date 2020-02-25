//
//  HomeView.swift
//  SwiftUI Design and Code
//
//  Created by Quin’darius Lyles-Woods on 2/24/20.
//  Copyright © 2020 Quin’darius Lyles-Woods. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }.padding(.horizontal)
                .padding(.top, 30)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
