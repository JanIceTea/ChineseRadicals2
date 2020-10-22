//
//  DetailPresenter.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 12/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

protocol DetailPresentationLogic {
    func presentDetail(response: Detail.FetchDetail.Response)
}

class DetailPresenter: DetailPresentationLogic {
    
    weak var viewController: DetailDisplayLogic?
    
    // MARK: Present Detail
    
    private func exampleDescription(withWords words:[ExampleWord]) -> String {
        if words.isEmpty {
            return ""
        }
        //for now onnly use one word
        let word = words[0]
        return "\(word.radical.long)\n\n\(word.description)"
    }
    
    func presentDetail(response: Detail.FetchDetail.Response) {
        
        let examples = exampleDescription(withWords: response.exampleWords)
        let viewModel = Detail.FetchDetail.ViewModel(description: response.description, header: response.header, exampleWordsDescription: examples)
        viewController?.displayDetail(viewModel: viewModel)
    }
}
