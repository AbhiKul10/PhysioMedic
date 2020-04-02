//
//  FeedbackView.swift
//  PhysioMed
//
//  Created by Abhi Kulshrestha on 01/04/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import Foundation
import SwiftUI

struct feedback : View{
    @Binding var feed: String
    var body: some View{
        ZStack{
            Color("Blackish")
        VStack(spacing:50){
            HStack{
                Image(systemName: "square.and.pencil").resizable().frame(width: 35, height: 35).foregroundColor(.primary)
                Text("FEEDBACK")
            }.font(.system(size: 40))
                .foregroundColor(.gray)
                .font(.system(.headline))
            .padding()
            ZStack{
                TextField("Feedback", text: $feed).padding()
                
                .frame(width: 300, height: 280)
                
                ZStack{
                               Button(action: {
                                   self.feed = ""
                               }){
                                   Image("sendb")
                                    .resizable().frame(width: 30, height: 30)
                                   }.padding()
                               
                                   //.background(Color("light_grey"))
                               .foregroundColor(.black)
                           }.cornerRadius(30)
                               //.padding(.all,5)
                               .offset(x:130, y:125)
            }.padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("mono_blue"), Color("light_grey")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
                
           
        }.padding(.bottom,80)
    }
  }
}
/*
struct SearchView : View {
    
    @Binding var txt: String
    
    var body : some View{
        VStack{
            
            ZStack{
                
                HStack{
                    
                    TextField("Search", text: $txt).padding(.trailing, 75)
                    
                }.padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                HStack{
                    
                    Spacer()
                    Button(action: {
                        self.txt = " "
                    }) {
                        
                        Text("Cancel")
                    }.foregroundColor(.black)
                }.padding()
            }
        }.padding()
    }
*/
