// swift-tools-version: 6.2
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "swift-codable-observable",
    platforms: [
        .macOS(.v13),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "CodableObservable",
            targets: ["CodableObservable"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "602.0.0")
    ],
    targets: [
        .macro(
            name: "CodableObservableMacros",
            dependencies: [
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax")
            ]
        ),
        .target(
            name: "CodableObservable",
            dependencies: ["CodableObservableMacros"],
            path: "Sources/CodableObservable"
        ),
        .testTarget(
            name: "CodableObservableTests",
            dependencies: ["CodableObservable"]
        )
    ]
)
