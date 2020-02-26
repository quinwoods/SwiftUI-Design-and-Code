//
//  CourseList.swift
//  SwiftUI Design and Code
//
//  Created by Quin’darius Lyles-Woods on 2/26/20.
//  Copyright © 2020 Quin’darius Lyles-Woods. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        VStack {
            CourseView()
        }
        
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @State var show = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUI app to the app store with advanced techniques like api data, packages and cms")
                Text("About this course")
                    .font(.title).bold()
                Text("This course text is just something that I am making up as we speak right now some people think its hard to think of things to say but if you just. ")
                Text("Type exacatly what you are thinking then you have plenty of material its not the longest and thoughtful thoughts but it is definitly better than nothing. I really enjoy listening to Sidewalk by the weekend")
            }
            .padding(30)
                .offset(y: show ? 460 : 0)
            .frame(maxWidth: show ? .infinity : screen.width - 60 , maxHeight:  show  ? .infinity : 220, alignment: .top)
                 .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .opacity(show ? 1: 0)
            
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("SwiftUI Advanced").font(.system(size: 24, weight: .bold)).foregroundColor(.white)
                        Text("20 Sections").foregroundColor(.white).opacity(0.7)
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "Logo1"))
                            .opacity(show ? 0 :1 )
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.white)
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Card6"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(show ? 60 : 20)
                // .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280 )
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color:  Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.show.toggle()
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}
