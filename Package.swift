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
            exact: "2.17.7"
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
            url: "https://dl.ad-stir.com/sdk/spm/2.17.7/ISAdstirMediationAdapter.xcframework.zip",
            checksum: "e65d11170be1458596ab72701117f8abfb79d7f079414675c665ffb990f2bb7a"
        ),
    ]
)
