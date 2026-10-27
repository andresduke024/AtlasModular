// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AtlasModular",
    platforms: [.iOS(.v17), .macOS(.v14), .watchOS(.v7)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AtlasModular",
            targets: ["AtlasModular"]
        ),
    ],
    dependencies: [
        .package(path: "../swift-dependency-injector"),
        .package(path: "../AtlasRESTClient"),
        .package(path: "../AtlasNavigator"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AtlasModular",
            dependencies: [
                .product(name: "SwiftDependencyInjector", package: "swift-dependency-injector"),
                .product(name: "SwiftDependencyInjectorMacros", package: "swift-dependency-injector"),
                .product(name: "AtlasRESTClient", package: "AtlasRESTClient"),
                .product(name: "AtlasNavigator", package: "AtlasNavigator"),
            ]
        ),
        .testTarget(
            name: "AtlasModularTests",
            dependencies: ["AtlasModular"]
        ),
    ]
)
