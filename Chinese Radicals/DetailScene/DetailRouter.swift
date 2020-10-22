//
//  DetailRouter.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 12/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

@objc protocol DetailRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {
    
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?
}
