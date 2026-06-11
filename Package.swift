// swift-tools-version:5.7
import PackageDescription

func remoteBinary(_ name: String, url: String, checksum: String) -> Target {
    .binaryTarget(
        name: name,
        url: url,
        checksum: checksum
    )
}

let commonLinkerSettings: [LinkerSetting] = [
    .linkedFramework("SystemConfiguration"),
    .linkedFramework("AVFoundation"),
    .linkedFramework("CoreTelephony"),
    .linkedFramework("AudioToolbox"),
    .linkedFramework("CoreMedia"),
    .linkedFramework("VideoToolbox"),
    .linkedLibrary("sqlite3"),
    .linkedLibrary("z"),
    .linkedLibrary("c++"),
    .linkedLibrary("resolv"),
]

let package = Package(
    name: "NIMSDK_LITE",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "NIMSDK_LITE", targets: ["NIMSDK_LITE_NOS"]),
        .library(name: "NOS", targets: ["NIMSDK_LITE_NOS"]),
        .library(name: "FCS", targets: ["NIMSDK_LITE_FCS"]),
        .library(name: "QChat", targets: ["NIMSDK_LITE_QChat"]),
        .library(name: "FTS", targets: ["NIMSDK_LITE_FTS"]),
    ],
    targets: [
        .target(
            name: "NIMSDK_LITE_NOS",
            dependencies: [
                "NIMSDK",
                "NIMSocketRocket",
                "NIMQuic",
                "NIMNOS"
            ],
            path: "Sources/NOS",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_LITE_FCS",
            dependencies: [
                "NIMSDK",
                "NIMSocketRocket",
                "NIMQuic",
                "NIMFCS",
                "NIMAWSCore",
                "NIMAWSS3"
            ],
            path: "Sources/FCS",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_LITE_QChat",
            dependencies: [
                "NIMQChat"
            ],
            path: "Sources/QChat",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_LITE_FTS",
            dependencies: [
                "NIMDBEx"
            ],
            path: "Sources/FTS",
            linkerSettings: commonLinkerSettings
        ),
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMSDK.xcframework.zip", checksum: "2b22f9772e2cbcdc71f9a2a50ad930f0f58f6043d2d554caef86fe52575709e3"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMSocketRocket.xcframework.zip", checksum: "ece6bd0bf98c627f12a3b5e0e1f2ade43a3183c10e0431e249f944c85f1caeb7"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMQuic.xcframework.zip", checksum: "b72b27a248417c70e48a59227cc1d81a23396d928c8995c96be923009212eae9"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMNOS.xcframework.zip", checksum: "bf67d656862d0d9120da1a888889f29b763a1e913ed9e61fd28de8725c4bbdda"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMFCS.xcframework.zip", checksum: "e609218681d9aee34a95c8a9a1f2b1afb88557239e219f9b53bb518b7361f3d8"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMAWSCore.xcframework.zip", checksum: "fb8a18a41d3e35b597f427acf34c99c4e1935e7c79b144f7c73a78d8d157e7ea"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMAWSS3.xcframework.zip", checksum: "c54fef5e75281f6c27700e4f0bfc4b201670d71f3d50dff79650c5ede6b12908"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMQChat.xcframework.zip", checksum: "346496caec57a39737497404301b7956b3067ffe9ef6725d384aa459628e3616"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1781151024777/NIM_iOS_SDK_v10.9.90_a2e6c94/NIMDBEx.xcframework.zip", checksum: "825993eb6beb90b03e5975b6f7c003762ff00f91be980700e4e6b2a403feb5cd"),
    ]
)
