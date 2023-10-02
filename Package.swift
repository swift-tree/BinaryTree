// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
    .package(url: "https://github.com/swift-tree/Tree.git", .exact("1.0.2")),
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
