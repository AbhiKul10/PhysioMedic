//
//  ContentView.swift
//  PhysioMed
//
//  Created by Abhi Kulshrestha on 22/03/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var Physiomusc: [Physiomusc]
    @State var txt = ""
    @State var size = UIScreen.main.bounds.width / 1.6
    var body: some View {
        
        
        ZStack{
            //Color.pink
            
            
      NavigationView {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("mono_blue"), Color("light_grey")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            //Color("mono_blue").edgesIgnoringSafeArea(.all)
            VStack{
                
               // SearchView(txt : self.$txt)
                SearchsBar(text: $txt, placeholder: "Search Muscle")
                List{
                    ForEach(self.Physiomusc.filter {self.txt.isEmpty ? true : $0.name.lowercased().contains(self.txt.lowercased())}, id: \.self) { Physiooo in
                        NavigationLink(destination: DetailView(Physiomusc: Physiooo)){
                            Text(Physiooo.name)
                        }
                        
                    }.listRowBackground(LinearGradient(gradient: Gradient(colors: [Color("mono_blue"), Color("light_grey")]), startPoint: .leading, endPoint: .trailing))
                    

                                       
                    
                   /* ForEach(self.Physiomusc.filter{$0.name.lowercased().contains(self.txt.lowercased())}, id: \.name){Physioo in
                    Text(Physioo.name)
                        .bold().padding(8)
                    }*/
                    
                }
                .resignKeyboardOnDragGesture()
            
                }.navigationBarTitle("PhysioMedic")
                .padding()
                .listRowBackground(Color.red)
                .background(LinearGradient(gradient: Gradient(colors: [Color("mono_blue"), Color("light_grey")]), startPoint: .leading, endPoint: .trailing))
                
                    .navigationBarItems(leading: Button(action: {
                        
                        self.size = 0
                        
                    }, label: {
                        
                         Image("menu").resizable().frame(width: 20, height: 20)
                    }).foregroundColor(.primary))
        }
      }
             
            HStack{
                
                menu(feed: "", rowActive : true, size: $size)
                    .padding(.leading, -size)
                    .offset(x: -size)
                Spacer()
                
            }
            
        }
        .animation(.spring())
       
        
    }
   
            

}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}



struct menu : View{
    @State var feed: String
    @State var isProfileViewPresented = false
    @State var isProfileViewssPresented = false
    @State var isProfileViewPresentedAbout = false
    @State var isProfileViewPresentedAchive = false
    @State var isProfileViewPresentedEmergency = false
    var rowActive : Bool
    @Binding var size : CGFloat
    
    var body : some View{
        
        VStack{
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    self.size = UIScreen.main.bounds.width / 1.6
                    
                }) {
                    
                    Image("closed").resizable().frame(width: 15, height: 15).padding()
                }
                .clipShape(Circle())
               // .padding()
                
            }
            ZStack{
                Image("IMG_0410")
                 .resizable()
                    .frame(width: 70, height: 70)
                .clipShape(Circle())
                    .padding(.horizontal,24)
               
                
                Circle()
                    .stroke(Color("mono_blue"))
                    .frame(width: 70, height: 70)
                    .offset(x:-2, y:-1)
                
               Circle()
                .stroke(Color("new_blue"))
                .frame(width: 70, height: 70)
                .offset(x:2, y:1)
                
                
            }.padding()
            .padding()
            
           Button(action: {self.isProfileViewPresentedAbout = true}){
            HStack{
                
                Image(systemName: "person.fill").resizable().frame(width: 18, height: 18).foregroundColor(.primary).padding()
                
                Text("About").fontWeight(.medium)
                    .foregroundColor(.primary)
                
                
                Spacer()
            }.sheet(isPresented: $isProfileViewPresentedAbout, content: { aboutus() }).foregroundColor(.primary)
            }.padding(-4)
                .background(rowActive ? Color("whitish"): Color("whitish").opacity(0))
                .padding(.trailing, 20)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .offset(x: 20)
                .padding(.bottom)
            
            Button(action: {self.isProfileViewPresentedAchive = true}){
            HStack{
                Image(systemName: "rosette").resizable().frame(width: 15, height: 20).foregroundColor(.primary).padding()
                
                Text("Achievements").fontWeight(.medium)
                                    .foregroundColor(.primary)
                
                Spacer()
            }.sheet(isPresented: $isProfileViewPresentedAchive, content: { achieve() }).foregroundColor(.primary)
            }.padding(-4)
            .background(rowActive ? Color("whitish"): Color("whitish").opacity(0))
            .padding(.trailing, 20)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(x: 20)
            .padding(.bottom)
            
           Button(action: {self.isProfileViewPresentedEmergency = true}){
            HStack{
                Image(systemName: "phone.circle").resizable().frame(width: 23, height: 23).foregroundColor(.primary).padding()
                
                Text("Emergency").fontWeight(.medium)
                                    .foregroundColor(.primary)
                
                Spacer()
            }.sheet(isPresented: $isProfileViewPresentedEmergency, content: { emergency() }).foregroundColor(.primary)
            }.padding(-4)
            .background(rowActive ? Color("whitish"): Color("whitish").opacity(0))
            .padding(.trailing, 20)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(x: 20)
                .padding(.bottom)
            
           
            
            
           // Divider()
            
            HStack{
                Button(action: {self.isProfileViewssPresented = true}){
                    Image(systemName: "square.and.pencil").resizable().frame(width: 23, height: 23).foregroundColor(.primary).padding()
                
                Text("Send feedback").fontWeight(.medium)
                                    .foregroundColor(.primary)
                
                Spacer()
                }.sheet(isPresented: $isProfileViewssPresented, content: { feedback(feed: self.$feed) }).foregroundColor(.primary)
                
            }.padding(-4)
            .background(rowActive ? Color("whitish"): Color("whitish").opacity(0))
            .padding(.trailing, 20)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(x: 20)
                .padding(.bottom)
            
            
            HStack{
                Button(action: {self.isProfileViewPresented = true}){
                    Image(systemName: "questionmark.circle").resizable().frame(width: 23, height: 23).foregroundColor(.primary).padding()
                
                Text("Help").fontWeight(.medium)
                                    .foregroundColor(.primary)
                
                Spacer()
                    }.sheet(isPresented: $isProfileViewPresented, content: { Help() }).foregroundColor(.primary)
            }.padding(-5)
                .background(rowActive ? Color("whitish"): Color("whitish").opacity(0))
            .padding(.trailing, 20)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(x: 20)
            .padding(.bottom)
            Divider()
            Spacer()
            
            
            
        }.frame(width: UIScreen.main.bounds.width / 1.6)
            .background(LinearGradient(gradient: Gradient(colors: [Color("mono_blue"), Color("light_grey")]), startPoint: .leading, endPoint: .trailing))
        
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



#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(Physiomusc: PhysioDataa)
    }
}
#endif



