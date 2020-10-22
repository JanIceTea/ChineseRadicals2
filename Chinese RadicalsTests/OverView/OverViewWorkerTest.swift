//
//  OverViewWorkerTest.swift
//  Chinese RadicalsTests
//
//  Created by Jan Trutzschler on 12/10/2018.
//  Copyright © 2018 teatracks. All rights reserved.
//

import Foundation
import XCTest
@testable import Chinese_Radicals

class OverViewWorkerTest: XCTestCase {
    func testParsing() {
        let worker = OverViewWorker()
        worker.readJson()
        XCTAssertNotNil(OverViewWorker.content)
        guard let content = OverViewWorker.content else {
            XCTFail("no content")
            return
        }
        XCTAssertNotNil(content.chapters)
        XCTAssert(content.chapters.count > 0)
        XCTAssertNotNil(content.chapters[0].content)
        XCTAssert(content.chapters[0].content.count > 0)
        XCTAssertNotNil(content.chapters[0].content[0].radical)
        XCTAssertNotNil(content.chapters[0].content[0].radical.short)
        XCTAssertNotNil(content.chapters[0].content[0].radical.short == "亻")
    }
}
