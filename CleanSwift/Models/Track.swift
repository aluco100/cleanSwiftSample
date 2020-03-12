//
//  Track.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Track: Object, Mappable {
    
    @objc dynamic var kind: String = ""
    @objc dynamic var artistName: String = ""
    @objc dynamic var trackName: String = ""
    @objc dynamic var trackId: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        kind<-map["kind"]
        artistName<-map["artistName"]
        trackName<-map["trackName"]
        trackId<-map["trackId"]
    }
    
    override class func primaryKey() -> String? {
        return "trackId"
    }
    
}
