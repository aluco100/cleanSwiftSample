//
//  ListTracksPresenter.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Presentation Logic Definition
protocol ListTracksPresentationLogic {
    func presentFetchedTracks(response: ListTracks.FetchTracks.Response)
    func failure(error: Error)
    var vc: ListTracksDisplayLogic? {get set}
}

//MARK: - Presenter Definition
class ListTracksPresenter: ListTracksPresentationLogic {
    
    weak var vc: ListTracksDisplayLogic?
    
    //MARK: - Presentation Implementation
    func presentFetchedTracks(response: ListTracks.FetchTracks.Response) {
        let tracks = response.tracks
        let displayedTracks = tracks.map({ ListTracks.FetchTracks.ViewModel.DisplayedTrack(id: "\($0.trackId)", artist: $0.artistName, track: $0.trackName) })
        let viewModel = ListTracks.FetchTracks.ViewModel(displayedTracks: displayedTracks)
        self.vc?.displayFetchedTracks(viewModel: viewModel)
    }
    
    func failure(error: Error) {
        self.vc?.displayFailure(error: error)
    }
    
}
