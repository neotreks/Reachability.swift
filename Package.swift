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
            checksum: "7133627ccea034dfe7029746aec9415707be135521623289b2e25e3fca608642"
        )
    ]
)
