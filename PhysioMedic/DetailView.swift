//
//  DetailView.swift
//  PhysioMed
//
//  Created by Abhi Kulshrestha on 24/03/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import Foundation
import SwiftUI
import SafariServices

struct DetailView: View{
    @State var move: Bool = false
    @State var open : Bool = false
    var Physiomusc : Physiomusc
    var body: some View{
       
     //   Text(Physiomusc.Action)
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("mono_blue"), Color("light_grey")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
        VStack{
            Spacer()
        ZStack{
            CardView(title: "Action", detail: Physiomusc.Action, colors: Color("darker"))
            .offset(x: 0, y: move ? 130 : 0)
            .scaleEffect(move ? 1 : 0.80)
                        
            CardView(title: "Origin",detail: Physiomusc.Origin ,colors: Color("mono_blue"))
        .offset(x: 0, y: move ? 260 : -15)
                .scaleEffect(move ? 1 : 0.80)
        
            CardView(title: "Inserion",detail: Physiomusc.Insertion, colors: Color("dark"))
        .offset(x: 0, y: move ? 390 : -15)
        .scaleEffect(move ? 1 : 0.80)
        
            CardView(title: "Name", detail: Physiomusc.name , colors: Color("darkest"))
            .onTapGesture {
                self.move.toggle()
        }
            
             
      
        }
        .offset(x: 0, y: move ? -200 : -250)
        .animation(.spring())
       Spacer()
            
            
            
            Button(action: {
                           if let url = URL(string: self.Physiomusc.site) {
                                          UIApplication.shared.open(url)
                                      }
                                      }){
                                        HStack{
                                            Image("infoo")
                                                .resizable().frame(width: 20, height: 20)
                                          Text("For more Info")
                                            .foregroundColor(.gray)
                                            
                                            }.padding(5)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray, lineWidth: 1)
                                            
                                        )
                                        
                                    
            }.padding()
           
            }
    
    }
}
}

struct CardView: View {
    let title : String
    let detail : String
    let colors : Color
    var body : some View{
        
        ZStack{
            Rectangle()
            .fill(colors)
            .cornerRadius(12)
                .frame(width: 330, height:120)
            VStack{
            Text(title)
                .font(.callout)
            .bold()
                .foregroundColor(.primary)
        .shadow(color: .white, radius: 10, x: 1, y: 1)
                
                Text(detail)
                    .fontWeight(.light)
                    .foregroundColor(.primary)
                   
            } .frame(width: 300, height: 100, alignment: .center)
                .font(.system(size: 16))
                //.shadow(color: .gray, radius: 10, x: 1, y: 1)
        }
    }
}
/*
struct Secondarybutton: View{
    var Physiomusc : Physiomusc
    @Binding var open : Bool
    var color : Color
    var offsetX = 0
    var offsetY = 0
    var delay = 0.0
    
    var body : some View{
        Button(action: {}){
                .foregroundColor(.white)
            .font(.system(size: 16, weight: .bold))
        }.padding()
        .mask(Circle())
            .offset(x: open ? CGFloat(offsetX) : 0, y : open ? CGFloat(offsetY) : 0)
            .scaleEffect(open ? 1:0)
            .animation(Animation.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(Double(delay)))
        
    }
}*/
    

struct DetailView_Previews: PreviewProvider{
    static var previews: some View{
        DetailView(Physiomusc: PhysioDataa[3])
    }
}
/*
struct secondarybutton_Previews: PreviewProvider{
    static var previews: some View{
        secondarybutton(Physiomusc: PhysioDataa[1]
    }
}
}*/
