// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftAnalyser",
    products: [
        .executable(name: "swiftAnalyser", targets: ["swiftAnalyser"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/SourceKitten.git", from: "0.31.0")
    ],
    targets: [
        .target(
            name: "swiftAnalyser",
            dependencies: ["SourceKittenFramework"]),
    ]
)
