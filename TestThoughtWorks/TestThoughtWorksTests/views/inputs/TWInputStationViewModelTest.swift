//
// Created by MIGUEL MOLDES on 10/4/17.
// Copyright (c) 2017 MiguelMoldes. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import XCTest

@testable import TestThoughtWorks

class TWInputStationViewModelTest : XCTestCase {

    var view : TWInputStationView!

    let disposable = DisposeBag()

    var provider : TWLinesAndStationsProviderFake!

    func testProvider1() {
        let sut = makeSUT()
        XCTAssertNotNil(sut.provider)

        provider.searchExpectation = expectation(description: "search expectation")

        sut.updateTableSubject.asObservable()
            .subscribe(onNext:{
                _ in
//                updateTableExpectation.fulfill()
            })
            .addDisposableTo(disposable)

        sut.textHasChanged(str:"A")

        waitForExpectations(timeout: 1) {
            error in
            if error != nil {
                XCTFail()
            }
            let stationsFound = self.provider.stationsFound
            XCTAssertEqual(stationsFound?.count, 0)
        }
    }

    func testProvider2() {
        let sut = makeSUT()
        XCTAssertNotNil(sut.provider)

        provider.searchExpectation = expectation(description: "search expectation")

        sut.updateTableSubject.asObservable()
                .subscribe(onNext:{
                    _ in
//                    updateTableExpectation.fulfill()
                })
                .addDisposableTo(disposable)

        sut.textHasChanged(str:"Box")

        waitForExpectations(timeout: 1) {
            error in
            if error != nil {
                XCTFail()
            }
            let stationsFound = self.provider.stationsFound
            XCTAssertEqual(stationsFound?.count, 2)
        }
    }


// helpers

    private func makeSUT() -> TWInputStationViewModelFake {
        provider = makeProvider() as! TWLinesAndStationsProviderFake
        return TWInputStationViewModelFake(provider:provider)
    }

}
