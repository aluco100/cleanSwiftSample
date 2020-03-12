//
//  ListTracks.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Repositories definition
enum ListTracks {
    
    //MARK: - Use cases
    
    //MARK: - Fetch Tracks use case
    enum FetchTracks {
        struct Request {
            //TODO: Puede venir algo aca, o tal vez no
        }
        struct Response {
            //Es lo que espero que llegue
            var tracks: [Track]
        }
        //View Model Asociado a este caso de uso
        /**
                    NOTA: ESTO PUEDE SER OMITIDO PORQUE DEFINO UN MODELO MAS PRECISO EN LA SECCION MODELS
         */
        struct ViewModel {
            struct DisplayedTrack {
                var id: String
                var artist: String
                var track: String
            }
            var displayedTracks: [DisplayedTrack]
        }
    }
    
}
