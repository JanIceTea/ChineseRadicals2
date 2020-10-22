//
//  DetailInteractor.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 12/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

protocol DetailBusinessLogic {
    func fetchDetail(request: Detail.FetchDetail.Request)
}

protocol DetailDataStore {
    var description: String { get set }
    var header: String { get set }
    var exampleWords: [ExampleWord] { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    
    var presenter: DetailPresentationLogic?
    var description: String = ""
    var header: String = ""
    var exampleWords: [ExampleWord] = []
    
    // MARK: Perform operation on Detail
    
    func fetchDetail(request: Detail.FetchDetail.Request) {
        // Perform network requests here and present afterwards
        
        let response = Detail.FetchDetail.Response(description: description, header: header, exampleWords: exampleWords)
        presenter?.presentDetail(response: response)
    }
}
