//
//  OverViewRouter.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 07/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

@objc protocol OverViewRoutingLogic {
    func routeToDetails(from index:Int)
}

protocol OverViewDataPassing {
    var dataStore: OverViewDataStore? { get }
}

class OverViewRouter: NSObject, OverViewRoutingLogic, OverViewDataPassing {
    
    weak var viewController: OverViewViewController?
    var dataStore: OverViewDataStore?
    
    // MARK: Routing
    
    func routeToDetails(from index:Int) {
            let destinationVC = DetailViewController(nibName: nil, bundle: nil)
            var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(fromIndex: index, source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }

    // MARK: Navigation

    func navigateToSomewhere(source: OverViewViewController, destination: DetailViewController) {
        source.show(destination, sender: nil)
    }

    // MARK: Passing data

    func passDataToSomewhere(fromIndex index:Int, source: OverViewDataStore, destination: inout DetailDataStore) {
        destination.header = "\(source.currentContent[index].radical.long) \(source.currentContent[index].radical.short)"
        destination.description = source.currentContent[index].description
        destination.exampleWords = source.currentContent[index].words
    }
}
