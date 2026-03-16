// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Snapcat",
    products: [
        .executable(name: "Snapcat", targets: ["Snapcat"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Snapcat", dependencies: []),
        .testTarget(name: "SnapcatTests", dependencies: ["Snapcat"]),
    ]
)