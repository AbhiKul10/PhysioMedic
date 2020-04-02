//
//  Physiomusc.swift
//  PhysioMed
//
//  Created by Abhi Kulshrestha on 22/03/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import Foundation
import SwiftUI

struct Physiomusc: Hashable, Codable, Identifiable{
    
    var id: Int
    var name : String
    var Action : String
    var Origin : String
    var Insertion :  String
  //  var imagename : String
    var site : String
}
