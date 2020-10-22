//
//  OverViewWorker.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 07/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

class OverViewWorker {
    
    static var content: RadicalsContent?
    
    func readJson() {
        guard let url = Bundle.main.url(forResource: "Radicals", withExtension: "json") else {
            print("Missing stories file ...")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: url)
            let content = try decoder.decode(RadicalsContent.self, from: data)
            OverViewWorker.content = content
        } catch {
            print("Reading stories failed ...")
        }
    }
    
    func doSomeWork() {
        
    }
}
