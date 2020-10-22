//
//  OverViewPresenter.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 07/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

protocol OverViewPresentationLogic {
    func presentOverView(response: OverView.FetchOverView.Response)
}

class OverViewPresenter: OverViewPresentationLogic {
    
    weak var viewController: OverViewDisplayLogic?
    
    // MARK: Present OverView
    
    func presentOverView(response: OverView.FetchOverView.Response) {
        let radicals = response.content.map({ (content) -> String in
            return content.radical.short
        })
        
        let viewModel = OverView.FetchOverView.ViewModel(radicals: radicals)

        viewController?.displayOverView(viewModel: viewModel)
    }
}
