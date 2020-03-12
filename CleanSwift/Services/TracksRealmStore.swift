//
//  TracksRealmStore.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import RealmSwift

class TracksRealmStore: TrackStoreProtocol {
    
    //MARK: - Fetch Tracks Realm Definition
    func fetchTracks(completion: @escaping ([Track], TrackStoreError?) -> Void) {
        do {
            let realm = try Realm()
            let tracks = realm.objects(Track.self)
            completion(Array(tracks),nil)
        } catch let error{
            completion([],TrackStoreError.cannotFetch(error.localizedDescription))
        }
    }
    
    func fetchTracks(completion: @escaping TrackStoreFetchTracksCompletionHandler) {
        do {
            let realm = try Realm()
            let tracks = realm.objects(Track.self)
            completion(TrackStoreResult<[Track]>.success(result: Array(tracks)))
        } catch let error{
            completion(TrackStoreResult<[Track]>.failure(error: TrackStoreError.cannotFetch(error.localizedDescription)))
        }
    }
    
    func fetchTracks(completion: @escaping (() throws -> [Track]) -> Void) {
        do {
            let realm = try Realm()
            let tracks = realm.objects(Track.self)
            let result: [Track] = Array(tracks)
            completion{ return result }
        } catch let error{
            print(error)
            completion{ throw TrackStoreError.cannotFetch("Cannot fetch") }
        }
    }
    
}
