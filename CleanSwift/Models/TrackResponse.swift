//
//  TrackResponse.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import ObjectMapper

class TrackResponse: Mappable {
    
    var resultCount: Int = 0
    var results: [Track] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        resultCount<-map["resultCount"]
        results<-map["results"]
    }
    
}
