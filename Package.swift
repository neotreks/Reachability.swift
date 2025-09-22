// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReachabilitySwift",
    products: [
        .library(
            name: "ReachabilitySwift",
            targets: ["Reachability"]),
    ],
    targets: [
       .binaryTarget(
            name: "Reachability",
            url: "https://distribution.accuterra.com/com/accuterra/reachability/5.2.4/Reachability.xcframework.zip",
            checksum: "7a06dc2984d2bdfd9f6e36d3c3e19cb4fb35bfcb12f3a5283c4fa1d0a23dfc0e"
        )
    ]
)
