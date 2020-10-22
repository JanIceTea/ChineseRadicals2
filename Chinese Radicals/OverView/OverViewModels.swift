//
//  OverViewModels.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 07/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

enum OverView {
    
    // MARK: Use cases
    
    enum FetchOverView {
        
        struct Request {
            
        }
        
        struct Response {
            var content: [ChapterContent]
        }
        
        struct ViewModel {
            var radicals: [String]
        }
    }
}
