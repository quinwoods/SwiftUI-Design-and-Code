//
//  ContentView.swift
//  SwiftUI Design and Code
//
//  Created by Quin’darius Lyles-Woods on 2/22/20.
//  Copyright © 2020 Quin’darius Lyles-Woods. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius:show ? 20 :  0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
            )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -200 : 0)

                .scaleEffect(0.9)
                .rotationEffect(.init(degrees: show ? 0 : 10))
                .rotationEffect(.init(degrees: showCard ? -10 : 0 ))

                .rotation3DEffect(.init(degrees: showCard ? 0: 10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.5))

            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(y: showCard ? -140 : 0)
                .offset(x: viewState.width, y: viewState.height)

                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 0:5))
                .rotationEffect(.init(degrees: showCard ? -5 : 0 ))

                .rotation3DEffect(.init(degrees: showCard ? 0 : 5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.3))
            CardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(Color.black)
//                .cornerRadius(20).shadow(radius: 20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30: 20, style: .continuous))
            .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                self.showCard.toggle()
                }.gesture(DragGesture().onChanged{
                value in self.viewState = value.translation
                    self.show = true
                }
                .onEnded{
                    value in self.viewState = .zero
                    self.show.toggle()
                    }
            )
            
//            Used to show values when creating conditionals 
//            Text("\(bottomState.height)")
//                .offset(y: -300)
            
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 350 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(DragGesture().onChanged{
                    value in self.bottomState = value.translation
                    if self.showFull{
                        self.bottomState.height += -300
                    }
                    if self.bottomState.height < -300 {
                        self.bottomState.height = -300
                    }
                }
                .onEnded{
                    value in
                    if self.bottomState.height > 50 {
                        self.showCard = false
                    }
                    if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250  && self.showFull) {
                        self.bottomState.height = -300
                        self.showFull = true
                    }else
                    {self.bottomState = .zero
                        self.showFull = false
                    }
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Georgia State")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Influencer")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        
      
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Packages")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This package will contain items that a marketer will produce. The layout of this is not final and will be iterated upon.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
            
        .padding(.top , 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
