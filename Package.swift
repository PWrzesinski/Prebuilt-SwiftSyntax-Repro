// swift-tools-version: 6.2

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Prebuilt SwiftSyntax Repro",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", exact: "602.0.0")
    ],
    targets: [
        .macro(
            name: "PSRMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ],
            swiftSettings: [.strictMemorySafety()]
        ),
        .executableTarget(
            name: "App",
            dependencies: [
                .target(name: "PSRMacros")
            ],
            path: "Sources/App"
        ),
    ]
)
