// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "PDFRenderer",
    platforms: [
        .iOS(.v16), .macOS(.v13)
    ],
    products: [
        .library(name: "PDFRenderer", targets: ["PDFRenderer"])
    ],
    targets: [
        .target(name: "PDFRenderer")
    ]
)
