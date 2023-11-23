//
//  MainPresenterTest.swift
//  Rainbow_NLPTests
//
//  Created by Павел Грицков on 23.11.23.
//

import XCTest
@testable import Rainbow_NLP
final class MainPresenterTest: XCTestCase {
    var sut: MainPresenterProtocol!
    
    override func setUp() {
        super.setUp()
        sut = MainPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    
    func test_tappedNewGameButton() {
        // Given
        var tapped = false
        
        // When
        sut.tappedNewGameButton()
        
        // Then
        tapped = true
        XCTAssertTrue(tapped, "Method tappedNewGameButton() should be called")
    }
}

// MARK: - setUp() tearDown()
//    override func setUp() async throws {
//        try await super.setUp()
//
//        sut = MainPresenter()
//    }
//
//    override func tearDown() async throws {
//        try await super.tearDown()
//
//        sut = nil
//    }
    
//    override func setUpWithError() throws {
//        sut = MainPresenter()
//        try super.setUpWithError()
//    }
//
//    override func tearDownWithError() throws {
//        sut = nil
//    }

/*
 Вот краткое описание каждого метода:

 override func setUp()

 Это "старый" метод, который был доступен до появления поддержки асинхронности в XCTest. Он используется для настройки начальных условий перед выполнением каждого теста.
 override func setUpWithError() throws

 Это более новый метод, который предоставляет возможность обработки ошибок во время настройки тестовых условий. Он может использоваться для инициализации состояния перед тестированием и может бросать ошибку в случае неудачи.
 override func setUp() async throws

 Это еще более новый метод, введенный в Swift 5.5, который поддерживает асинхронную настройку тестовых условий. Он полезен, если ваши тесты требуют асинхронной инициализации данных или других асинхронных операций.
 Выбор метода зависит от ваших конкретных потребностей. Если у вас есть асинхронные операции, которые нужно выполнить перед тестами, setUp() async throws может быть полезным. Если вам нужно обрабатывать ошибки при настройке тестовых данных, setUpWithError() будет уместным выбором. В противном случае, если у вас просто есть начальное состояние, которое нужно инициализировать, setUp() подойдет.
 */
