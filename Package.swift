// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "BinaryTree",
  products: [
    .library(
      name: "BinaryTree",
      targets: ["BinaryTree"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/swift-tree/Tree.git", .exact("1.0.0")),
  ],
  targets: [
    .target(
      name: "BinaryTree",
      dependencies: ["Tree"]
    ),
    .testTarget(
      name: "BinaryTreeTests",
      dependencies: ["BinaryTree", "Tree"]
    ),
  ]
)
