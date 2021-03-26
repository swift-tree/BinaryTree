import BinaryTree
import Tree
import XCTest

final class BinaryTreeTests: XCTestCase {
  var tree: BinaryTree<Int>!
  var capturedItems: [Int]!

  override func setUp() {
    super.setUp()

    tree = .node(
      value: 5,
      .init(
        .empty,
        .node(
          value: 10, .init(
            .node(
              value: 6,
              .noDescendent
            ), .node(
              value: 15,
              .noDescendent
            )
          )
        )
      )
    )

    capturedItems = []
  }

  override func tearDown() {
    tree = nil
    capturedItems = nil

    super.tearDown()
  }

  func test_builder_init() {
    XCTAssertEqual(
      BinaryTree(5) {
        BinaryTree<Int>.empty
        BinaryTree(10) {
          BinaryTree(6)
          BinaryTree(15)
        }
      },
      tree
    )
  }

  func test_traversals_preOrder() {
    tree.traverse(method: .preOrder) { [unowned self] value, _ in
      self.capturedItems.append(value)
    }

    XCTAssertEqual(capturedItems, [5, 10, 6, 15])
  }

  func test_traversals_inOrder() {
    tree.traverse(method: .inOrder) { [unowned self] value, _ in
      self.capturedItems.append(value)
    }

    XCTAssertEqual(capturedItems, [5, 6, 10, 15])
  }

  func test_traversals_postOrder() {
    tree.traverse(method: .postOrder) { [unowned self] value, _ in
      self.capturedItems.append(value)
    }

    XCTAssertEqual(capturedItems, [6, 15, 10, 5])
  }

  func test_height_original() {
    XCTAssertEqual(tree.height, 3)
  }

  func test_height_emtpy() {
    tree = .empty

    XCTAssertEqual(tree.height, 0)
  }

  static var allTests = [
    ("test_height_emtpy", test_height_emtpy),
    ("test_height_original", test_height_original),
    ("test_traversals_inOrder", test_traversals_inOrder),
    ("test_traversals_postOrder", test_traversals_postOrder),
    ("test_traversals_preOrder", test_traversals_preOrder),
  ]
}
