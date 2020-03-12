//
//  TrackAPIStore.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RealmSwift

class TrackAPIStore: TrackStoreProtocol {
    
    //MARK: - Fetch Tracks Methods
    func fetchTracks(completion: @escaping ([Track], TrackStoreError?) -> Void) {
        AF.request("https://itunes.apple.com/search?term=jack+johnson&limit=25", method: .get).responseJSON(completionHandler: {
            response in
            guard response.error == nil else{
                completion([],TrackStoreError.cannotFetch(response.error!.localizedDescription))
                return
            }
            
            let result = response.value as? [String : Any] ?? [:]
            let mapper: Mapper<TrackResponse> = Mapper<TrackResponse>()
            let value = mapper.map(JSON: result) ?? TrackResponse()
            do{
                let realm = try Realm()
                try realm.write({
                    realm.add(value.results,update: .all)
                })
            }catch let error{
                print(error)
            }
            completion(value.results,nil)
        })
    }
    
    func fetchTracks(completion: @escaping TrackStoreFetchTracksCompletionHandler) {
        AF.request("https://itunes.apple.com/search?term=jack+johnson&limit=25", method: .get).responseJSON(completionHandler: {
            response in
            guard response.error == nil else{
                completion(TrackStoreResult<[Track]>.failure(error: TrackStoreError.cannotFetch(response.error!.localizedDescription)))
                return
            }
            
            let result = response.value as? [String : Any] ?? [:]
            let mapper: Mapper<TrackResponse> = Mapper<TrackResponse>()
            let value = mapper.map(JSON: result) ?? TrackResponse()
            do{
                let realm = try Realm()
                try realm.write({
                    realm.add(value.results,update: .all)
                })
            }catch let error{
                print(error)
            }
            completion(TrackStoreResult<[Track]>.success(result: value.results))
        })
    }
    
    func fetchTracks(completion: @escaping (() throws -> [Track]) -> Void) {
        AF.request("https://itunes.apple.com/search?term=jack+johnson&limit=25", method: .get).responseJSON(completionHandler: {
            response in
            guard response.error == nil else{
                completion{
                    throw TrackStoreError.cannotFetch(response.error!.localizedDescription)
                }
                return
            }
            
            let result = response.value as? [String : Any] ?? [:]
            let mapper: Mapper<TrackResponse> = Mapper<TrackResponse>()
            let value = mapper.map(JSON: result) ?? TrackResponse()
            do{
                let realm = try Realm()
                try realm.write({
                    realm.add(value.results,update: .all)
                })
            }catch let error{
                print(error)
            }
            completion{
                return value.results
            }
        })
    }
    
    
}
