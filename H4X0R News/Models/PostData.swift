//
//  PostData.swift
//  H4X0R News
//
//  Created by Michaela Beyer on 2022-10-11.
//

import Foundation

struct Results : Decodable {
    
    let hits : [Post]
}

struct Post : Decodable, Identifiable {
    
    //Behöver en variabel som kallas id, här kan vi få id att anta samma id som vi får utav objectId från Json objektet.
    var id: String {
        return objectID
    }
    let objectID : String
    let points : Int
    let title : String
    let url : String?
    
}
