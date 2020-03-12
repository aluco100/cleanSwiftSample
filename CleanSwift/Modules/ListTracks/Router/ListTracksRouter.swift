//
//  ListTracksRouter.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Segues logic
@objc protocol ListTracksRoutingLogic{
    //TODO: Aqui puedes definir todos los segues
    func routeToTrackDetail(segue: UIStoryboardSegue?)
}

//MARK: - Data Passing Logic
protocol ListTracksDataPassing {
    var dataStore: ListTracksDataStore? {get}
}

class ListTracksRouter: NSObject, ListTracksRoutingLogic, ListTracksDataPassing {
    
    weak var vc: ListTracksViewController?
    
    //MARK: - Data Passing Implementation
    var dataStore: ListTracksDataStore?
    
    //MARK: - Routing Logic Implementation
    func routeToTrackDetail(segue: UIStoryboardSegue?) {
        /**
         ESTO QUEDA PARA EL PROXIMO VC QUE CREE
         */
        //A modo de ejemplo paso la data por aca
//        if let segue = segue {
//          let destinationVC = segue.destination as! CreateOrderViewController
//          var destinationDS = destinationVC.router!.dataStore!
//          passDataToCreateOrder(source: dataStore!, destination: &destinationDS)
//        } else {
//          let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "CreateOrderViewController") as! CreateOrderViewController
//          var destinationDS = destinationVC.router!.dataStore!
//          passDataToCreateOrder(source: dataStore!, destination: &destinationDS)
//          navigateToCreateOrder(source: viewController!, destination: destinationVC)
//        }
    }
    
}
