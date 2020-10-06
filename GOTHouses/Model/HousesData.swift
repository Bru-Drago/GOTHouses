//
//  HousesData.swift
//  GOTHouses
//
//  Created by Bruna Fernanda Drago on 05/10/20.
//

import Foundation

struct HousesData : Codable {
    
    var name:String
    var region : String
    var coatOfArms:String?
    var words : String?
    var currentLord: String?
    var overlord : String?
    var titles: [String]?
    var seats : [String]?
    
    
}
