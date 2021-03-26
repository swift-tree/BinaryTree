import Tree

@_functionBuilder
public enum BinaryTreeBuilder<T> {
  public static func buildBlock(_ left: Tree<T, BinaryChildren<T>>, _ right: Tree<T, BinaryChildren<T>>) -> BinaryChildren<T> {
    .init(left, right)
  }

  public static func buildBlock(_ children: BinaryChildren<T>) -> BinaryChildren<T> {
    children
  }
}

public extension BinaryTree where Descendent == BinaryChildren<Element> {
  init(_ value: Element, @BinaryTreeBuilder <Element> builder: () -> BinaryChildren<Element>) {
    self = .node(value: value, builder())
  }

  init(_ value: Element) {
    self = .leaf(value)
  }
}
