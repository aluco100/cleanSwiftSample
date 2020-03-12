//
//  ListTracksInteractor.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Business Logic
protocol ListTracksBusinessLogic {
    func fetchTracks(request: ListTracks.FetchTracks.Request)
}

//MARK: - Data Store Definition
protocol ListTracksDataStore {
    var tracks: [Track]? {get}
}

//MARK: - Interactor Definition

class ListTracksInteractor: ListTracksBusinessLogic, ListTracksDataStore {
    
    var presenter: ListTracksPresentationLogic?
    
    //MARK: - Worker Definition
    /// En el fondo tengo que decidir por que worker me voy (servicio) con un lazy var
    lazy var worker: TrackWorker = {
       //Por ahora lo paso por la api
        let worker = TrackWorker(trackStore: TracksRealmStore())
        return worker
    }()
    
    //MARK: - Data store implementation
    var tracks: [Track]?
    
    //MARK: - Business Logic implementation
    func fetchTracks(request: ListTracks.FetchTracks.Request) {
        worker.fetchTracks { (tracks, error) in
            guard error == nil else{
                self.presenter?.failure(error: error!)
                return
            }
            self.presenter?.presentFetchedTracks(response: ListTracks.FetchTracks.Response(tracks: tracks ?? []))
        }
    }
    
}
