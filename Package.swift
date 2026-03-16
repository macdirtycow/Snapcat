// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Snapcat",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "snapcat", targets: ["Snapcat"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "Snapcat",
            dependencies: [],
            path: "Sources"
        )
    ]
)
