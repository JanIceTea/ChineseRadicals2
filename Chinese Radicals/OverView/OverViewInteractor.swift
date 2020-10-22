//
//  OverViewInteractor.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 07/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

protocol OverViewBusinessLogic {
    func fetchOverView(request: OverView.FetchOverView.Request)
}

protocol OverViewDataStore {
    var currentContent: [ChapterContent] { get set }
}

class OverViewInteractor: OverViewBusinessLogic, OverViewDataStore {
    
    var presenter: OverViewPresentationLogic?
    let worker = OverViewWorker()
    var currentContent: [ChapterContent] = []

    // MARK: Perform operation on OverView
    
    func fetchOverView(request: OverView.FetchOverView.Request) {
        // Perform network requests here and present afterwards
        worker.readJson()
        guard let contents = OverViewWorker.content else {
            return
        }
        currentContent = contents.chapters[0].content
        let response = OverView.FetchOverView.Response(content: contents.chapters[0].content)
        presenter?.presentOverView(response: response)
    }
}
