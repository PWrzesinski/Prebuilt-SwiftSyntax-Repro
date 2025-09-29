// swift-tools-version: 6.0

import PackageDescription
import CompilerPluginSupport

let plugins: [Target.PluginUsage]

#if os(Linux)
    plugins = []
#else
    plugins = [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
#endif

let package = Package(
    name: "Prebuilt SwiftSyntax Repro",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", exact: "600.0.1"),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins.git", exact: "0.61.0")
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
            path: "Sources/App",
            plugins: plugins
        ),
    ]
)
