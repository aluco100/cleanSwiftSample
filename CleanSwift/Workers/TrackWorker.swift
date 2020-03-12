//
//  TrackWorker.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation

class TrackWorker {
    
    //MARK: - Dependency Injection
    var trackStore: TrackStoreProtocol
    
    init(trackStore: TrackStoreProtocol) {
        self.trackStore = trackStore
    }
    
    //MARK: - Fetch Tracks
    func fetchTracks(completion: @escaping ([Track]?,TrackStoreError?) -> Void){
        self.trackStore.fetchTracks { ( results: TrackStoreResult<[Track]>) in
            switch results{
            case .success(let result):
                completion(result,nil)
                break
            case .failure(let error):
                completion(nil,error)
                break
            }
        }
    }
    
}

