// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "SwiftAnalyser",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .executable(
            name: "SwiftAnalyser",
            targets: ["SwiftAnalyser"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/jpsim/SourceKitten.git", from: "0.31.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftAnalyser",
            dependencies: [.product(name: "SourceKittenFramework", package: "SourceKitten")]),
     /*   .testTarget(
            name: "SwiftAnalyserTests",
            dependencies: ["SwiftAnalyser"]),
    */]
)
