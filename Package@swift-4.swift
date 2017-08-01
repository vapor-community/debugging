// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Debugging",
    products: [
        .library(name: "Debugging", targets: ["Debugging"])
    ],
    targets: [
        .target(name: "Debugging"),
        .testTarget(name: "DebuggingTests", dependencies: ["Debugging"])
    ]
)
