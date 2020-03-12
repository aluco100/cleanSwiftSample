//
//  TrackStore.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
protocol TrackStoreProtocol {
    
    //MARK: - Fetch Generic Optional Error
    func fetchTracks(completion: @escaping ([Track],TrackStoreError?) -> Void)
    
    //MARK: - Fetch With completion handler
    func fetchTracks(completion: @escaping TrackStoreFetchTracksCompletionHandler)
    
    //MARK: - Fetch With  inner closure
    func fetchTracks(completion: @escaping (() throws -> [Track]) -> Void)
    
}

//MARK: - Completion Definition
typealias TrackStoreFetchTracksCompletionHandler = (TrackStoreResult<[Track]>) -> Void

//MARK: - Worker Track Store Error
enum TrackStoreError: Equatable, Error {
    case cannotFetch(String)
}
//MARK: - Track Store Result

enum TrackStoreResult<T> {
    case success(result: T)
    case failure(error: TrackStoreError)
}
