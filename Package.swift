// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeyboardExtensionKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "KeyboardExtensionKit",
            targets: ["KeyboardExtensionKit"]
        ),
        .library(
            name: "Sample",
            targets: ["Sample"]
        )
    ],
    targets: [
        .target(
            name: "KeyboardExtensionKit"
        ),
        .testTarget(
            name: "KeyboardExtensionKitTests",
            dependencies: ["KeyboardExtensionKit"]
        ),
        .target(
            name: "Sample",
            dependencies: ["KeyboardExtensionKit"]
        )
    ]
)
