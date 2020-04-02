//
//  SearchBar.swift
//  PhysioMed
//
//  Created by Abhi Kulshrestha on 23/03/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import Foundation
import SwiftUI
 
 
struct SearchsBar: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder : String
    class Coordinator: NSObject,UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    func makeCoordinator() -> SearchsBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchsBar>) -> UISearchBar {
        let searchsBar = UISearchBar(frame: .zero)
        searchsBar.delegate = context.coordinator
        searchsBar.placeholder = placeholder
        searchsBar.searchBarStyle = .minimal
        return searchsBar
        
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchsBar>) {
        uiView.text = text
    }
    
    
}
