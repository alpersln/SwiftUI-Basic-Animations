//
//  ContentView.swift
//  animations
//
//  Created by calatinalper on 10.07.2021.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Animations Part1")){
                    NavigationLink(
                        destination: Example1(),
                        label: {
                            Text(".easeIn Animation")
                        })
                    NavigationLink(destination:Example2(),
                        label: {
                            Text(".easeInOut Animation")
                        })
                    NavigationLink(destination: Example3(),
                        label: {
                            Text(".interpolatingSpring Animation")
                                   })
                    NavigationLink(
                        destination: Example4(),
                        label: {
                            Text(".overlay.easeOut.repeatForever Animation")
                        })
                    NavigationLink(
                        destination: Example5(),
                        label: {
                            Text(".rotationEffect Animation")
                        })
                    }
                }.navigationBarTitle("SwiftUI Animations")
            }
        }
    }

//MARK:PART 1:
struct Example1: View {
    @State private var amount: CGFloat =  1
    var body: some View {
        Button("Click Me"){
            self.amount += 1
        }.padding(50)
        .background(Color.purple)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(amount)
        .animation(.easeIn)
    }
}
//MARK:PART 2
struct Example2: View {
    @State private var amount: CGFloat =  1
    var body: some View {
        Button("Click Me"){
            self.amount += 1
        }.padding(50)
        .background(Color.orange)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(amount)
        .animation(.easeInOut(duration: 2))
    }
}
//MARK:PART 3
struct Example3: View {
    @State private var amount: CGFloat =  1
    var body: some View {
        Button("Click Me"){
            self.amount += 1
        }.padding(50)
        .background(Color.black)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(amount)
        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
    }
}
//MARK:PART 4
struct Example4:View {
    @State private var animationAmount: CGFloat = 1
    var body: some View{
        Button("Click Me"){
            
        }.padding(100)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
        Circle()
            .stroke(Color.red)
            .scaleEffect(animationAmount)
            .opacity(Double(2 - animationAmount))
            .animation(
                Animation.easeInOut(duration: 2)
                    .repeatForever(autoreverses: false)
            )
        ).onAppear {
            self.animationAmount = 2
        }
    }
}
//MARK:PART 5
struct Example5:View {
    @State private var rotatingAngle: Double = 0
    @State private var animationAmount: CGFloat = 1
    var body: some View{
        Button(action: {
            self.rotatingAngle += 90
        }) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotatingAngle))
                .animation(.interpolatingSpring(mass:1,stiffness: 1, damping: 0.5,initialVelocity:1))
                .overlay(
                        Rectangle()
                            .stroke(Color.black)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .rotationEffect(Angle(degrees: 45))
                            .animation(
                                Animation.easeInOut(duration: 2)
                                    .repeatForever(autoreverses: true)
                            )
                        ).onAppear {
                            self.animationAmount = 2
                
        }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct Example5:View {
//    @State private var animationAmount: CGFloat = 1
//    var body: some View{
//        Button("") {
//
//        }.padding(100)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Rectangle())
//        .overlay(
//        Rectangle()
//            .stroke(Color.red)
//            .scaleEffect(animationAmount)
//            .opacity(Double(2 - animationAmount))
//            .rotationEffect(Angle(degrees: 45))
//            .animation(
//                Animation.easeInOut(duration: 2)
//                    .repeatForever(autoreverses: true)
//            )
//        ).onAppear {
//            self.animationAmount = 2
//        }
//    }
//}
