// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APAlertView",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "APAlertView",
            targets: ["APAlertView"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "APAlertView",
            path: "Sources/APAlertView"),
        .testTarget(
            name: "APAlertViewTests",
            dependencies: ["APAlertView"],
            path: "Tests/APAlertViewTests"),
    ]
) 