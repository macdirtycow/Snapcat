// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Snapcat",
    platforms: [.macOS(.v13)],
    products: [
        .executable(
            name: "snapcat",
            targets: ["Snapcat"]
        )
    ],
    targets: [
        .executableTarget(
            name: "Snapcat",
            path: "Sources"
        )
    ]
)