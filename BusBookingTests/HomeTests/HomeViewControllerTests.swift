//
//  HomeViewControllerTests.swift
//  BusBookingTests
//
//  Created by Jose Augusto on 05/04/23.
//

import XCTest
@testable import BusBooking

final class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    
    override func setUpWithError() throws {
        sut = HomeViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testViewDidLoadMustConfigTitle() throws {
        //Given
                
        //When
        sut.viewDidLoad()
        let title = try XCTUnwrap(sut.title)
        //Then
        XCTAssertEqual(title, "Bus Booking")
    }
    
    func testViewDidLoadMustCalledConfigAction() {
        //Given
        
        //When
        sut.viewDidLoad()
        
        //Then
        XCTAssertEqual(sut.homeView.swapButton.allTargets.count, 1)
        XCTAssertEqual(sut.homeView.buttonSearchTicket.allTargets.count, 1)
    }
    
    func testViewDidLoadMustCalledSetupDelegate() {
        //Given
        
        //When
        sut.viewDidLoad()
        
        //Then
        XCTAssertTrue(sut.homeView.departureTextField.delegate is HomeViewController)
        XCTAssertTrue(sut.homeView.picker.delegate is HomeViewController)
        XCTAssertTrue(sut.homeView.promotionCollection.delegate is HomeViewController)
        XCTAssertTrue(sut.homeView.promotionCollection.dataSource is HomeViewController)
        XCTAssertTrue(sut.cityViewModel.delegate is HomeViewController)
    }
    
    func testViewWillAppearMustCalledDefaultParameters() {
        //Given
        let arriveText = UITextFieldSpy()
        sut.homeView.arrivalTextField = arriveText
        sut.homeView.departureTextField = arriveText
        sut.homeView.arrivalTextField.text = "Teste"
        sut.homeView.departureTextField.text = "Teste"
        
        //When
        sut.viewWillAppear(true)
        
        //Then
        XCTAssertTrue(sut.homeView.arrivalTextField.text == "")
        XCTAssertTrue(sut.homeView.departureTextField.text == "")
        XCTAssertTrue(sut.homeView.picker.isHidden)
    }
    
    func testViewWillAppearMustCalledIsPromotionValid() {
        //Given
        let expectation = expectation(description: "wait for request")
        var cityViewModelMock = CityViewModelMock()
        sut.cityViewModel = cityViewModelMock
        cityViewModelMock.promotionValidCompletionHandler = {
            expectation.fulfill()
        }
        //When
        sut.viewWillAppear(true)
        waitForExpectations(timeout: 2)
        //Then
        XCTAssertTrue(cityViewModelMock.wasPromotionValidCalled)
        XCTAssertTrue(sut.homeView.picker.isHidden)
    }

}
