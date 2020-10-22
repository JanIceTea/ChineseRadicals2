//
//  DetailModels.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 12/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

enum Detail {
    
    // MARK: Use cases
    
    enum FetchDetail {
        
        struct Request {
            
        }
        
        struct Response {
            var description: String
            var header: String
            var exampleWords: [ExampleWord]
        }
        
        struct ViewModel {
            var description: String?
            var header: String?
            var exampleWordsDescription: String?
        }
    }
}
