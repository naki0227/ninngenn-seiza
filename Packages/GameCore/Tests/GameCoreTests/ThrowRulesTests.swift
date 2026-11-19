import XCTest

@testable import GameCore

final class ThrowRulesTests: XCTestCase {
  func testThreeThrowsPerStage() {
    XCTAssertEqual(ThrowRules.throwsPerStage, 3)
  }
}
