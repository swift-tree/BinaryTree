public extension BinaryTree where Descendent == BinaryChildren<Element> {
  typealias Printer = (String) -> Void
  
  var description: String {
    var result = ""
    Self.print(self) {
      result.append($0.description)
    }
    return result
  }
  
  private static func print(
    _ root: Self?,
    prefix: String = "",
    isLeft: Bool = false,
    accumulator: Printer
  ) {
    guard let root = root, let value = root.value else {return}
    let nodeLabel = "\(value)"
    let nodePrefix = prefix + (isLeft ? "│   " : "    ")
    
    print(root.descendent?.right, prefix: nodePrefix, isLeft: false, accumulator: accumulator)
    accumulator(prefix + (isLeft ? "└── " : "┌── ") + nodeLabel + "\n")
    print(root.descendent?.left, prefix: nodePrefix, isLeft: true, accumulator: accumulator)
  }
}

