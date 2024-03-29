// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MerkleFlowModels",
    products: [
        .library(
            name: "MerkleFlowModels",
            targets: ["MerkleFlowModels"]),
    ],
    dependencies: [
        // Base crypto types
        .package(url: "https://github.com/pumperknickle/CryptoStarterPack.git", from: "1.0.3"),
        // Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MerkleFlowModels",
            dependencies: ["CryptoStarterPack", "FluentSQLite"]),
        .testTarget(
            name: "MerkleFlowModelsTests",
            dependencies: ["MerkleFlowModels"]),
    ]
)
