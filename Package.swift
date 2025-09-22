// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReachabilitySwift",
    products: [
        .library(
            name: "ReachabilitySwift",
            targets: ["ReachabilitySwift"]),
    ],
    targets: [
       .binaryTarget(
            name: "ReachabilitySwift",
            url: "https://distribution.accuterra.com/com/accuterra/reachability/5.2.4/ReachabilitySwift.xcframework.zip",
            checksum: "09cd82a00ffe99a911255f4dc3067cd621529dc64eabf3cb526ddd901f72913a"
        )
    ]
)
