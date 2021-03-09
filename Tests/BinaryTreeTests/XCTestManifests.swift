import XCTest

#if !canImport(ObjectiveC)
  public func allTests() -> [XCTestCaseEntry] {
    [
      testCase(BinaryTreeTests.allTests),
    ]
  }
#endif
