//
//  ListTracksViewController.swift
//  CleanSwift
//
//  Created by Alfredo Luco on 11-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import UIKit

//MARK: - Display Logic Definition
protocol ListTracksDisplayLogic: class {
    func displayFetchedTracks(viewModel: ListTracks.FetchTracks.ViewModel)
    func displayFailure(error: Error)
}

class ListTracksViewController: UIViewController, ListTracksDisplayLogic {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Interactor Instancetype
    var interactor: ListTracksBusinessLogic?
    
    //MARK: - Router Instancetype
    var router: (NSObjectProtocol & ListTracksRoutingLogic & ListTracksDataPassing)?
    
    
    //MARK: - Setup
    private func setup(){
        let vc = self
        let interactor = ListTracksInteractor()
        let presenter = ListTracksPresenter()
        let router = ListTracksRouter()
        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        router.dataStore = interactor
    }
    
    //MARK: - View Did load
    override func viewDidLoad() {
        super.viewDidLoad()
        //AQUI IMPLEMENTO EL SETUP PORQUE NO OCUPO INITS
        self.setup()
        let request = ListTracks.FetchTracks.Request()
        self.interactor?.fetchTracks(request: request)
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Routing Implementation
    //TODO: QUEDA PARA LA OTRA
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segue = segue.identifier{
            if let router = router, router.responds(to: NSSelectorFromString(segue)){
                router.perform(NSSelectorFromString(segue))
            }
        }
    }
    
    //MARK: - Display Logic Implementation
    var displayedTracks: [ListTracks.FetchTracks.ViewModel.DisplayedTrack] = []
    
    func displayFetchedTracks(viewModel: ListTracks.FetchTracks.ViewModel) {
        displayedTracks = viewModel.displayedTracks
        self.tableView.reloadData()
    }
    
    func displayFailure(error: Error) {
        print(error)
    }

}

extension ListTracksViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedTracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = displayedTracks[indexPath.row].track
        return cell
    }
}
