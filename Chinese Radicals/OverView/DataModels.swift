//
//  DataModels.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 12/10/2018.
//  Copyright © 2018 teatracks. All rights reserved.
//

import Foundation

struct Radical: Codable {
    var short: String
    var long: String
}

struct ExampleWord: Codable {
    var radical: Radical
    var description: String
}

struct ChapterContent: Codable {
    var radical: Radical
    var description: String
    var words: [ExampleWord]
}

struct Chapter: Codable {
    var content: [ChapterContent]
}

struct RadicalsContent: Codable {
    var chapters: [Chapter]
}
