//
//  BMI_CAL_Assignment_1UITestsLaunchTests.swift
//  BMI_CAL_Assignment_1UITests
//
//  Created by Arch Umeshbhai Patel on 2025-01-31.
//

import XCTest

final class BMI_CAL_Assignment_1UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
