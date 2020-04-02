//
//  help.swift
//  PhysioMed
//
//  Created by Abhi Kulshrestha on 31/03/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import Foundation
import SwiftUI

struct Help: View{
    var body: some View{
       /* LinearGradient(gradient: Gradient(colors: [Color("mono_blue"), Color("light_grey")]), startPoint: .leading, endPoint: .trailing)
            .overlay(*/
        ZStack{
            Color("Blackish")
        VStack(spacing : 50){
           // Spacer()
            
            HStack{
                
                Image(systemName: "questionmark.circle").resizable().frame(width: 40, height: 40).foregroundColor(.primary)
                Text("HELP!")
            }.font(.system(size: 40))
                .foregroundColor(Color.gray)
                .font(.system(.headline))
                .padding()
                
                
           /* .overlay(RoundedRectangle(cornerRadius: 35)
            .stroke(Color.white, lineWidth: 7))*/
            
            Text("PhysioMedic is an App that basically contains various types of Muscles. This App aims to help Physiotherapist in making. PhysioMedic contains Muscles and the basic information (like Action, Origin, Insertion) about the Muscles. For more Information our App contains a link to a site that contains verified information for the same. For any incorrect information or suggestions you may refer to Feedback Section.").padding()
                .frame(width: 340, height: 280, alignment: .center)
            .font(.system(size: 17))
                .overlay(RoundedRectangle(cornerRadius: 35)
                .stroke((LinearGradient(gradient: Gradient(colors: [Color("mono_blue"), Color("light_grey")]), startPoint: .leading, endPoint: .trailing)), lineWidth: 7))
            
            .foregroundColor(.gray)
                //.padding(.top)

           /* .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 7))*/
            //Spacer(minLength: 100)
            
        
        }.padding(.bottom,120)
        
        
        
           
        }
        
        
    }
}
