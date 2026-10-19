// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdstirSDKLevelPlayAdapter",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AdstirAdsLevelPlayAdapter",
            targets: ["AdstirAdsLevelPlayAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ironsource-mobile/LevelPlay-Swift-Package.git",
            "9.3.0"..<"10.0.0"
        ),
        .package(
            url: "https://github.com/united-adstir/adstirsdk-swift-package.git",
            exact: "2.17.8"
        )
    ],
    targets: [
        .target(
            name: "AdstirAdsLevelPlayAdapterTarget",
            dependencies: [
                .target(name: "AdstirAdsLevelPlayAdapter"),
                .product(name: "UnityMediationSDK", package: "LevelPlay-Swift-Package"),
                .product(name: "AdstirAds", package: "adstirsdk-swift-package"),
            ],
            path: "Sources"
        ),
        .binaryTarget(
            name: "AdstirAdsLevelPlayAdapter",
            url: "https://dl.ad-stir.com/sdk/spm/2.17.8/ISAdstirMediationAdapter.xcframework.zip",
            checksum: "4bf1cf9ae6d20951b4b1e6a383423d7f4bddd2c648e6f191bfdd92a8efba6532"
        ),
    ]
)
