import Tree

public struct BinaryChildren<T>: DescendentProtocol {
  public var left, right: BinaryTree<T>

  public static var noDescendent: Self { .init(.empty, .empty) }
  
  public init(_ left: BinaryTree<T>, _ right: BinaryTree<T>) {
    self.left = left
    self.right = right
  }
}

public extension BinaryTree {
  static func leaf(_ e: Element) -> Self {.node(value: e, .noDescendent)}
}

public extension BinaryChildren { var height: Int { max(left.height, right.height) } }

extension BinaryChildren: Equatable where T: Equatable {}
extension BinaryChildren: Hashable where T: Hashable {}
