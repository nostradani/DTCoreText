// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DTCoreText",
    platforms: [
        .iOS(.v8),         //.v8 - .v13
        .macOS(.v10_10),    //.v10_10 - .v10_15
        .tvOS(.v9),        //.v9 - .v13
    ],
    products: [
        .library(
            name: "DTCoreText",
            targets: ["DTCoreText"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nostradani/DTFoundation.git", from: "1.7.16"),
    ],
    targets: [
        .target(
            name: "DTCoreText",
            dependencies: [
                .product(name: "DTFoundation", package: "DTFoundation"),
            ],
            path: "Core",
            cSettings: [
                .define("TARGET_OS_IPHONE=1", .when(platforms: [.iOS, .tvOS])),
                .define("TARGET_OS_OSX=1", .when(platforms: [.macOS])),
            ]),
        .testTarget(
            name: "DTCoreTextTests",
            dependencies: ["DTCoreText"]),
    ]
)
