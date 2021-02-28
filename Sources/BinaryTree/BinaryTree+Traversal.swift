import Tree

public enum DepthFirstTraversal {
  case preOrder
  case inOrder
  case postOrder
}

public extension Tree where Descendent == BinaryChildren<Element> {
  func traverse(
    initialPath: [Element] = [],
    method: DepthFirstTraversal,
    visit: @escaping (Element, [Element]) -> Void
  ) {
    guard case let .node(value: value, children) = self else { return }
    let path = initialPath + [value]
    switch method {
    case .preOrder:
      visit(value, path)
      children.left.traverse(initialPath: path, method: method, visit: visit)
      children.right.traverse(initialPath: path, method: method, visit: visit)
    case .inOrder:
      children.left.traverse(initialPath: path, method: method, visit: visit)
      visit(value, path)
      children.right.traverse(initialPath: path, method: method, visit: visit)
    case .postOrder:
      children.left.traverse(initialPath: path, method: method, visit: visit)
      children.right.traverse(initialPath: path, method: method, visit: visit)
      visit(value, path)
    }
  }
}
